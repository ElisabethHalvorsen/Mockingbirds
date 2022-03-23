import 'package:flutter/material.dart';
import 'package:mapbox_gl_platform_interface/mapbox_gl_platform_interface.dart'
    as LatLong;
import 'package:veloplan/alerts.dart';
import '../../models/docking_station.dart';
import '../../providers/docking_station_manager.dart';
import '../../providers/location_service.dart';
import '../../screens/dock_sorter_screen.dart';

///helper class to build the bubble underneath every location TextField
class PanelExtensions {
  final locationService = LocationService();
  BuildContext? context;
  Alerts alert = Alerts();

  PanelExtensions({required this.context});

  static PanelExtensions of({BuildContext? context}) {
    return PanelExtensions(context: context);
  }

  //late DockingStation closetDockStation;
  dockingStationManager _stationManager = dockingStationManager();

  ///builds the bubble which displays the closest docking station from the place specified in the location TextField
  Widget buildDefaultClosestDock(
      TextEditingController editDockTextEditController,
      TextEditingController placeTextController) {
    //stuff();

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Icon(Icons.subdirectory_arrow_right),
          flex: 0,
        ),
        Expanded(
          child: TextField(
            enabled: false,
            controller: editDockTextEditController,
            decoration: InputDecoration(
              hintText: "Default closest dock",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
              onPressed: () async {
                if (placeTextController.text.isEmpty) {
                  alert.showSnackBarErrorMessage(
                      context!, alert.fillInLocationBeforeEditingDockMesssage);
                  print("hello");
                  return;
                } else {
                  print(editDockTextEditController.text);
                  // getCoords(editDockTextEditController);
                }

                List temp = await locationService
                    .getPlaceCoords(placeTextController.text);
                checkInputLocation(
                    placeTextController, editDockTextEditController);
                // print("closet dock stattion ${closetDockStation.name}");

                // List temp = await locationService
                //     .getPlaceCoords(placeTextController.text);
                // checkInput(placeTextController, editDockTextEditController);
                //print("closet dock stattion ${closetDockStation.name}");

                Navigator.push(
                    context!,
                    MaterialPageRoute(
                        builder: (context) => DockSorterScreen(
                            _latLng(temp.first, temp.last),
                            editDockTextEditController)));

                ///closetDockStation)));
              },
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.navigate_next_outlined,
              )),
          flex: 0,
        ),
      ],
    );
  }

  LatLong.LatLng _latLng(double lat, double lng) => LatLong.LatLng(lat, lng);

  void checkInputLocation(TextEditingController placeTextController,
      TextEditingController editDockTextEditController) async {
    print("THIS IS CLOSET DOCK");
    if (placeTextController.text.isEmpty) {
      print("Nothing specified");
    } else {
      print("REACHED METHOD GETCLOSETDOCK");

      List coordPlace = await locationService.getPlaceCoords(
          placeTextController.text); //getting coord of the place [lat,lng]
      print(coordPlace.toString());
      getClosetDock(
          coordPlace.first, coordPlace.last, editDockTextEditController);
      //TO-DO
      // - change to get closet dock with available bikes after getting num of cyclist
    }
  }

  ///Fills in the bubble, which is displayed underneath every textfield, with the name of the docking station which is closest
  ///to the location specfied by the user
  void getClosetDock(double? lat, double? lng,
      TextEditingController editDockTextEditController) async {
    try {
      LatLong.LatLng latlngPlace =
          LatLong.LatLng(lat!, lng!); //coverting list to latlng
      dockingStationManager _stationManager = dockingStationManager();
      await _stationManager.importStations();
      print(latlngPlace);
      DockingStation closestDock = _stationManager.getClosestDock(latlngPlace);
      print("KEPPENS");
      // print(closestDock);
      //this.closetDockStation = closestDock;
      //print("closet dock!!!!! ${closestDock.name}");
      //print("closet dock???????? ${closetDockStation.name}");
      editDockTextEditController.text = closestDock.name;
    } catch (error) {
      print(" caught this exception :  ------------------ ${error}");
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text("Sorry this request failed, please try again later!"),
        ),
      );
    }
  }

  /// Set the text of the closest dock
  void setEditDockText(
      TextEditingController editDockTextEditController, String text) {
    editDockTextEditController.text = text;
  }
}
