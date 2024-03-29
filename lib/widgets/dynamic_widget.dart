import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:veloplan/models/docking_station.dart';
import 'package:veloplan/helpers/live_location_helper.dart';
import 'package:veloplan/providers/location_service.dart';
import 'package:veloplan/styles/colors.dart';
import 'package:veloplan/utilities/dart_exts.dart';
import 'package:veloplan/widgets/panel_widget/panel_widget_exts.dart';

/// The widgets the user dynamically creates during runtime, for them to specify the locations of the journey.
/// Each dynamic widget has the following properties:
/// - red cross, to delete a location from the journey planner list
/// - TextField, which redirects the user to [PlaceSearchScreen] to insert a location to the journey planner list
/// - menu item icon, to indicate to the user that the list is reorderable via dragging
/// Author: Rahin
/// Contributor(s): Fariha
class DynamicWidget extends StatelessWidget {
  final TextEditingController placeTextController = TextEditingController();
  final TextEditingController editDockTextEditController =
      TextEditingController();
  List<List<double?>?>? selectedCoords;
  Function(int)? onDelete;
  int position = -1;
  final Map? coordDataMap;
  late Map<int, DockingStation> latLngMap;
  bool isFrom =
      false; //isFrom is false because this is the dynamic widget which is not the from
  late bool isScheduled;
  int numberOfCyclists = 1;

  /// Set the position of the selected coordinates list to the passed in index.
  void setIndex(index) {
    position = index;
  }

  /// Listen to changes for user input on the location specified in the location textfield.
  void initState() {
    placeTextController.addListener(() {
      PanelExtensions.of().checkInputLocation(
          placeTextController,
          editDockTextEditController,
          latLngMap,
          position,
          isFrom,
          numberOfCyclists);
    });
  }

  DynamicWidget(
      {Key? key,
      required this.selectedCoords,
      this.coordDataMap,
      required this.latLngMap,
      required this.isFrom,
      required this.isScheduled,
      required this.numberOfCyclists})
      : super(key: key);
  // late DockingStation closetDockStation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          int len = selectedCoords?.length ?? 0;
                          if (position < len) {
                            latLngMap
                                .removeWhere((key, value) => key == position);
                            selectedCoords?.removeAt(position);
                          }
                          onDelete?.call(position);
                        },
                        padding: EdgeInsets.symmetric(vertical: 17.0),
                        constraints: BoxConstraints(),
                        icon: const Icon(Icons.close_outlined,
                            size: 15, color: Colors.red),
                      ),
                      Expanded(
                        child: TextField(
                          onEditingComplete: () {
                            PanelExtensions.of(context: context)
                                .checkInputLocation(
                                    placeTextController,
                                    editDockTextEditController,
                                    latLngMap,
                                    position,
                                    isFrom,
                                    numberOfCyclists);
                          },
                          readOnly: true,
                          onTap: () {
                            _handleSearchClick(context, position);
                          },
                          controller: placeTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 12.0, right: 12.0),
                            labelText: "TO",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (coordDataMap == null) return;
                                _useCurrentLocationButtonHandler(
                                    coordDataMap!, placeTextController);
                              },
                              icon: Icon(Icons.my_location,
                                  size: 20, color: CustomColors.green),
                            ),
                            hintText: 'Where to?',
                            border: circularInputBorder(),
                            focusedBorder: circularInputBorder(
                                width: 2.0, color: CustomColors.green),
                            disabledBorder: circularInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PanelExtensions(context: context).buildDefaultClosestDock(
                  editDockTextEditController,
                  placeTextController,
                  latLngMap,
                  isFrom,
                  numberOfCyclists,
                  isScheduled,
                  position: position,
                )
              ],
            ),
          ),
          const Icon(Icons.menu),
        ],
      ),
    );
  }

  ///Executed when the user presses on a location TextField. The [position] is the position of the SearchBar of destinations
  ///respect to the other SearchBars in the Journey Planner
  void _handleSearchClick(BuildContext context, int position) async {
    final result = await context.openSearch();
    final feature = result as Feature?;
    if (feature != null) {
      final len = selectedCoords?.length ?? 0;
      placeTextController.text = feature.placeName ?? "N/A";

      if (position > ((selectedCoords?.length) ?? 0) - 1 ||
          (selectedCoords?.isEmpty ?? true)) {
        selectedCoords?.add(feature.geometry?.coordinates);
      } else {
        selectedCoords?[position] = feature.geometry?.coordinates;
      }

      PanelExtensions.of(context: context).fillClosestDockBubble(
          feature.geometry?.coordinates.first,
          feature.geometry?.coordinates.last,
          editDockTextEditController,
          latLngMap,
          position,
          isFrom,
          numberOfCyclists);
    }
  }

  ///Handler for when the user removes a dynamic widget from the list
  void removeDynamic(Function(int) onDelete) {
    this.onDelete = onDelete;
  }

  ///Reacts to user input for the location TextField
  void checkInputLocation({int? position}) {
    PanelExtensions.of().checkInputLocation(
      placeTextController,
      editDockTextEditController,
      latLngMap,
      position ?? this.position,
      isFrom,
      numberOfCyclists,
    );
  }

  ///When called, this function sets location of a TextField to the users current location. The [controller] is filled in
  ///with the current location of the user.
  _useCurrentLocationButtonHandler(
      Map response, TextEditingController controller) async {
    sharedPreferences.setString('source', json.encode(response));
    String place = response['place'];
    double latitudeOfPlace = response['location'].latitude;
    double longitudeOfPlace = response['location'].longitude;
    List<double?> currentLocationCoords = [latitudeOfPlace, longitudeOfPlace];
    controller.text = place;
    checkInputLocation();
    if (position > ((selectedCoords?.length) ?? 0) - 1 ||
        (selectedCoords?.isEmpty ?? true)) {
      selectedCoords?.add(currentLocationCoords);
    } else {
      selectedCoords?[position] = currentLocationCoords;
    }
  }
}
