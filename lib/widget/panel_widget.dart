import 'dart:async';
import 'dart:convert';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:veloplan/screens/journey_planner_screen.dart';
import 'package:veloplan/screens/place_search_screen.dart';
import '../main.dart';
import '../providers/location_service.dart';
import 'package:veloplan/helpers/shared_prefs.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:veloplan/alerts.dart';
import 'package:veloplan/helpers/live_location_helper.dart';

/*
When rendered, the journey_planner_screen will have this panel_widget at the bottom. It is an interactive panel the user can
slide up or down, when wanting to input their desired locations for the journey.

@author - Rahin Ashraf
 */
extension BuildContextExt on BuildContext {
  Future<dynamic> openSearch() {
    return Navigator.of(this).push(MaterialPageRoute(
        builder: (settings) =>
            PlaceSearchScreen(LocationService(), isPop: true)));
  }
}

class PanelWidget extends StatefulWidget {
  final ScrollController scrollController;
  final PanelController panelController;
  final StreamController<List<DynamicWidget>> dynamicWidgets;
  final Dra<DynamicWidget> listDynamic;
  final List<List<double?>?> selectedCords;
  final TextEditingController fromTextEditController;
  final TextEditingController toTextEditController;
  final Stream<MapPlace> address;
  final Map<String, List<double?>> selectionMap;
  final Map<String, List<double?>> staticListMap;

  const PanelWidget(
      {required this.selectionMap,
      required this.address,
      required this.scrollController,
      required this.dynamicWidgets,
      required this.listDynamic,
      required this.selectedCords,
        required this.staticListMap,
      required this.toTextEditController,
      required this.fromTextEditController,
      required this.panelController,
      Key? key})
      : super(key: key);

  @override
  PanelWidgetState createState() {
    return PanelWidgetState();
  }
}

class PanelWidgetState extends State<PanelWidget> {
  Stream<List<DynamicWidget>> get dynamicWidgetsStream =>
      widget.dynamicWidgets.stream;
  final locService = LocationService();
  late Map<String, List<double?>> selectionMap;
  late TextEditingController firstTextEditingController =
      TextEditingController();
  late Map<String, List<double?>> staticListMap;
  late Map response;
  late List<DragAndDropList> lists;


  static const String fromLabelKey ="From";
  static const String toLabelKey = "To";

  final Alerts alert = Alerts();

  //creates a new dynamic widget and adds this to the list of destinations for the journey
  addDynamic() {
    widget.listDynamic.add(DynamicWidget(
      selectedCords: widget.selectedCords,
      cordDataMap: response,
    ));
    widget.dynamicWidgets.sink.add(widget.listDynamic);
  }

  //Initialises variables and listens for user interaction to act on
  @override
  void initState() {
    staticListMap = widget.staticListMap;
    final selectedCords = widget.selectedCords;
    selectionMap = widget.selectionMap;

    LatLng currentLocation = getLatLngFromSharedPrefs();
    locService.reverseGeoCode(
        currentLocation.latitude, currentLocation.longitude).then((value){
          setState(() {
            if(mounted){
              response = value;
            }
          });
    });

    widget.address.listen((event) {
      final dynamicWidget = DynamicWidget(selectedCords: selectedCords, cordDataMap: response,);
      dynamicWidget.textController.text = event.address ?? "";
      dynamicWidget.position = widget.listDynamic.length;
      widget.listDynamic.add(dynamicWidget);
      print("DynamicWidget_pos: ${dynamicWidget.position} ${selectedCords.length} _${widget.listDynamic.length}");

      if(dynamicWidget.position > selectedCords.length){

        selectedCords.add( [event.cords?.latitude, event.cords?.longitude]);
      }else{

        selectedCords.insert(dynamicWidget.position,
            [event.cords?.latitude, event.cords?.longitude]);
      }
      widget.dynamicWidgets.sink.add(widget.listDynamic);

    });

    lists = allLists.map().toList();




    super.initState();
  }

  //When called, this function sets the first location of the journey to the users current location
  _useCurrentLocationButtonHandler(TextEditingController controller, String key) async {
    sharedPreferences.setString('source', json.encode(response));
    String place = response['place'];
    double latitudeOfPlace = response['location'].latitude;
    double longitudeOfPlace = response['location'].longitude;
    List<double?> currentLocationCoords = [latitudeOfPlace, longitudeOfPlace];
    controller.text = place;
    staticListMap[key] = currentLocationCoords;
    // TODO: W
  }

  /*
  Function which builds the static row of components which are displayed permanently. Statically built, as every journey
  needs to specify a starting point
  */
  Widget _buildStatic(TextEditingController controller, {String? hintText, required String label,
    required Function(List<double?>) onAddressAdded}) {
    // widget.textEditingController
    return Row(
        children: [
          const SizedBox(width: 10,),
           Container(width: 50,
           child: Text(label,
               style: const TextStyle(
                 fontWeight: FontWeight.normal,
                 fontSize: 20,
               )),),

          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              child: TextField(
                readOnly: true,
                onTap: () {
                  _handleSearchClick(context, controller, onAddressAdded);
                },
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _useCurrentLocationButtonHandler(controller, label);
                    },
                    icon: const Icon(
                      Icons.my_location,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //SizedBox(width: 10),
          TextButton(
            onPressed: () async {
              print("Link carasoul stuff here");
              List temp = await locService.getPlaceCoords(controller.text);
              print(temp);
            },
            child: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 50,
              color: Colors.green,
            ),
          ),
        ],
      );
  }

  void addCordFrom(List<double?> newCord){
    staticListMap[fromLabelKey] = newCord;
  }
  void addCordTo(List<double?> newCord){
    staticListMap[toLabelKey] = newCord;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          buildDragHandle(),
          const SizedBox(height: 6),
          const Center(
            child: Text(
              "Explore London",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 35),
            ),
          ),
          const SizedBox(height: 8),

          _buildStatic(widget.fromTextEditController, hintText: "Where from?",
              label: "From", onAddressAdded: addCordFrom),
          _buildStatic(widget.toTextEditController, hintText: "Where to?", label: "To", onAddressAdded: addCordTo),

          Expanded(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DragAndDropLists(
                  onItemReorder: (int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {

                  },
                  onListReorder: (int oldListIndex, int newListIndex) {

                  },
                  children: children
              ),
              StreamBuilder<List<DynamicWidget>>(
                builder: (_, snapshot) {
                  List<DynamicWidget> listOfDynamics = snapshot.data ?? [];

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final dynamicWidget = listOfDynamics[index];
                      dynamicWidget.position = index;
                      dynamicWidget.removeDynamic((p0) {
                        widget.listDynamic.removeAt(index);
                        widget.dynamicWidgets.sink.add(widget.listDynamic);
                      });
                      return dynamicWidget;
                    },
                    itemCount: listOfDynamics.length,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                },
                stream: dynamicWidgetsStream,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ), flex: 0,),
          FloatingActionButton(
            onPressed: addDynamic,
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                primary: Colors.white,
              ),
              onPressed: () {
                applyConstraints(widget.fromTextEditController, widget.toTextEditController);

                if(areAdjacentCoods(widget.selectedCords)){
                  alert.showCantHaveAdajcentSnackBar(context);
                }

                List<List<double?>?> tempList = [];
                tempList.addAll(staticListMap.values);
                tempList.addAll(widget.selectedCords);
                print("ALL_COORDINATES => $tempList");
              },
              child: const Text(
                "START",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void applyConstraints(TextEditingController fromEditingController, TextEditingController toEditingController){
    if(startLocationMustBeSpecified(fromEditingController) || startLocationMustBeSpecified(toEditingController)){
      return;
    }

    if(oneDestinationMustBeSpecified()){
      return;
    }

    if(aSearchBarCannotBeEmpty(widget.listDynamic)){
      return;
    }
  }

  //Returns all the coordinates for the locations the user specifies
  List<List<double?>?> getCoordinatesForJourney() {
    return widget.selectedCords;
  }

  bool areAdjacentCoods(List<List<double?>?> myList){
    for(int i = 0; i < myList.length - 1 ; i++){
      if(myList[i]?.first == myList[i+1]?.first && myList[i]?.last == myList[i+1]?.last){
        print("Adjacents exist");
        return true;
      }
    }
    print("Adjacents do not exist");
    return false;
  }

  //The logic to restrict the user from being able to start a journey, with blank location fields
  bool aSearchBarCannotBeEmpty(List<DynamicWidget>? list) {
    bool isFieldNotEmpty = true;
    if (list == null) {
      alert.showWhereToTextFieldsMustNotBeEmptySnackBar(context);
      return false;
    }
    for (var element in list) {
      if (element.textController.text.isEmpty) {
        isFieldNotEmpty = false;
        return true; //true if there is a textfield that is empty
      }
    }
    if (!isFieldNotEmpty) {
      alert.showWhereToTextFieldsMustNotBeEmptySnackBar(context);
      return false;
    }
    return false;
  }

  //The logic to restrict the user from being able to start a journey without a starting point
  bool startLocationMustBeSpecified(TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty) {
      alert.showStartLocationMustNotBeEmptySnackBar(context);
      return true;
    }
    return false;
  }

  //The grey handle bar, displayed at the very top of the panel_widget, to display to the user to swipe up on the panel
  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            height: 5,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        //onTap: togglePanel,
      );

  @override
  void dispose() {
    super.dispose();
  }

  //When triggered, redirects the user to the place_search_Screen in order for them to specify a location to visit
  //for the journey

  void _handleSearchClick(BuildContext context,
      TextEditingController textEditingController, Function(List<double?>) onAddressAdded) async {
    final selectedCords = widget.selectedCords;
    final tempPosition = selectedCords.length;
    final result = await context.openSearch();
    print("Navigator_Navigator_Navigator => $tempPosition");
    final feature = result as Feature?;
    if (feature != null) {
      textEditingController.text = feature.placeName ?? "N/A";
      final featureCord = feature.geometry?.coordinates;
      if(featureCord != null) {
        onAddressAdded.call(featureCord);
      }
     // staticList = feature.geometry?.coordinates;
    }
  }

  //The logic to restrict the user from being able to start a journey without defining at least one destination for the journey
  bool oneDestinationMustBeSpecified() {
    if (widget.listDynamic.isEmpty) {
      alert.showAtLeastOneDestinationSnackBar(context);
      return true;
    }
    return false;
  }

//void togglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();
}

/*
 The widgets the user dynamically creates during runtime, for them to specify the locations of the journey.
 Each dynamic widget is a row which comes with a row of children:
    - red cross, to delete a location from the journey planner list
    - TextField , to insert a location to the journey planner list
    - green > icon, to allow users to specify specific docks (if they wish) of the locations user specifies in the TextField
 */
class DynamicWidget extends StatelessWidget {
  late TextEditingController textController = TextEditingController();
  List<List<double?>?>? selectedCords;
  Function(int)? onDelete;
  int position = -1;
  final locationService = LocationService();
  final Map? cordDataMap;

  //setter for the position index
  void setIndex(index) {
    position = index;
  }

  DynamicWidget({Key? key, required this.selectedCords, this.cordDataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 17),
          //Expanded(
          TextButton(
            onPressed: () {
              int len = selectedCords?.length ?? 0;
              if (position < len) {
                selectedCords?.removeAt(position);
              }
              onDelete?.call(position);
            },
            child: const Icon(
              Icons.close_outlined,
              size: 35,
              color: Colors.red,
            ),
          ),
          //),
          Expanded(
            child: TextField(
              readOnly: true,
              onTap: () {
                _handleSearchClick(context, position);
              },
              controller: textController,
              decoration: InputDecoration(
                suffixIcon:  IconButton(
                  onPressed: () {
                    if(cordDataMap == null)return;
                    _useCurrentLocationButtonHandler(cordDataMap!, textController);
                  },
                  icon: const Icon(
                    Icons.my_location,
                    size: 20,
                    color: Colors.blue,
                  ),
                ),
                suffixIconColor: Colors.blue,
                hintText: 'Where to?',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
            ),
          ),
          //Expanded(
          TextButton(
            onPressed: () async {
              print("Link carasoul stuff here");
              List temp = await locationService.getPlaceCoords(textController.text);
              print(temp);
            },
            child: const Icon(
              Icons.info_outline,
              size: 50,
              color: Colors.green,
            ),
          ),
          //),
        ],
      );
  }

  //Executed when the user presses on a search TextField
  void _handleSearchClick(BuildContext context, int position) async {
    final result = await context.openSearch();
    print("Navigator_Navigator_Navigator => $position");
    final feature = result as Feature?;
    if (feature != null) {
      final len = selectedCords?.length ?? 0;
      textController.text = feature.placeName ?? "N/A";

      if (position > ((selectedCords?.length) ?? 0) - 1 ||
          (selectedCords?.isEmpty ?? true)) {
        selectedCords?.add(feature.geometry?.coordinates);
      } else {
        selectedCords?[position] = feature.geometry?.coordinates;
      }
    }
    print("RESULT => $result");
  }

  void removeDynamic(Function(int) onDelete) {
    this.onDelete = onDelete;
  }

  //When called, this function sets the first location of the journey to the users current location
  _useCurrentLocationButtonHandler(Map response, TextEditingController controller) async {
    sharedPreferences.setString('source', json.encode(response));
    String place = response['place'];
    double latitudeOfPlace = response['location'].latitude;
    double longitudeOfPlace = response['location'].longitude;
    List<double?> currentLocationCoords = [latitudeOfPlace, longitudeOfPlace];
    controller.text = place;

    if (position > ((selectedCords?.length) ?? 0) - 1 ||
        (selectedCords?.isEmpty ?? true)) {
      selectedCords?.add(currentLocationCoords);
    } else {
      selectedCords?[position] = currentLocationCoords;
    }
  }

}
