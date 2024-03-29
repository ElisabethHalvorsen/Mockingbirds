import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veloplan/helpers/database_helpers/statistics_helper.dart';
import 'package:veloplan/helpers/navigation_helpers/map_drawings.dart';
import 'package:veloplan/helpers/navigation_helpers/navigation_conversions_helpers.dart';
import 'package:veloplan/helpers/navigation_helpers/navigation_helpers.dart';
import 'package:veloplan/helpers/shared_prefs.dart';
import 'package:veloplan/models/itinerary.dart';
import 'package:veloplan/models/map_models/base_map_with_route_model.dart';
import 'package:veloplan/providers/docking_station_manager.dart';
import 'package:veloplan/scoped_models/map_model.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:veloplan/helpers/live_location_helper.dart';
import 'package:veloplan/utilities/enums/travel_type.dart';
import 'package:veloplan/models/docking_station.dart';

/// Map screen focused on a user's live location
/// Author(s): Elisabeth Halvorsen k20077737
/// Contributor(s): Eduard Ragea k20067643
class MapWithRouteUpdated extends BaseMapboxRouteMap {
  late List<LatLng> _journey;
  late List<DockingStation> _docks;
  final Itinerary _itinerary;
  final BuildContext context;
  late int numberCyclists;
  final Set<Symbol> _polylineSymbols = {};
  bool isAtGoal = false;
  bool firstLoactionCompleted = true;
  late Map<dynamic, dynamic> _routeResponse;
  Timer? timer;

  ValueNotifier<num> distance = ValueNotifier(0);
  ValueNotifier<num> duration = ValueNotifier(0);
  ValueNotifier<String> dockName = ValueNotifier("");
  double distanceTravelled = 0;
  LatLng oldLocation = LatLng(getLatLngFromSharedPrefs().latitude,
      getLatLngFromSharedPrefs().longitude);

  final userID = FirebaseAuth.instance.currentUser!.uid;

  List<dynamic> _journeyPoints = [];
  int currentStation = 0;
  bool buttonPressed = true;
  dockingStationManager _dockManager = dockingStationManager();
  MapWithRouteUpdated(MapModel model, this.context, this._itinerary)
      : super(_itinerary, model) {
    _docks = _itinerary.docks!;
    this.dockName.value = _itinerary.docks![currentStation].name;
    this._journey = convertDocksToLatLng(_itinerary.docks!)!;
    this.numberCyclists = _itinerary.numberOfCyclists!;
  }

  void checkAndUpdateDock() async {
    bool isDockFree = await _dockManager.checkDockWithAvailableSpace(
        _docks[currentStation], numberCyclists);
    if (!isDockFree) {
      _docks[currentStation] = _dockManager.getClosestDockWithAvailableSpace(
          _journey[currentStation], numberCyclists);
    }
  }

  @override
  void onMapCreated(MapboxMapController controller) async {
    this.controller = controller;
    model.setController(controller);
    _setTimers();
    model.fetchDockingStations();
    _displayJourney();
    controller.onSymbolTapped.add(onSymbolTapped);
  }

  /// sets all our timers
  void _setTimers() {
    updateLocationAndCameraTimer();
    createStatisticsTimer();
    updateRouteTimer();
    updateDockTimer();
  }

  /// Initialize periodic timer for updating location and camera position
  /// Calculate and store the distance travelled between timer steps on the device
  void updateLocationAndCameraTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) async {
      if (isAtGoal) {
        t.cancel();
      }

      await updateCurrentLocation();
      final currentLocation = getLatLngFromSharedPrefs();
      distanceTravelled += calculateDistance(oldLocation, currentLocation);
      String n = distanceTravelled.toString();
      oldLocation = LatLng(getLatLngFromSharedPrefs().latitude,
          getLatLngFromSharedPrefs().longitude);
      _updateCameraPosition();
      _updateLiveCameraPosition();
    });
  }

  /// Initialize periodic timer to update the route displayed
  void updateRouteTimer() {
    timer = Timer.periodic(Duration(seconds: 30), (Timer t) async {
      if (isAtGoal) {
        t.cancel();
      }
      await updateRoute();
    });
  }

  /// Create a timer just for constantly updating the distance travelled to server.
  void createStatisticsTimer() {
    timer = Timer.periodic(Duration(minutes: 1), (Timer t) async {
      await incrementActivityDistance(userID, distanceTravelled * 1000);
      distanceTravelled = 0;
      final va = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .get();
      final data = va.data();
    });
  }

  /// Initialize periodic timer to check if it's necessary to redirect to another docking station
  void updateDockTimer() {
    timer = Timer.periodic(Duration(minutes: 5), (Timer t) {
      if (isAtGoal) {
        t.cancel();
      }
      checkAndUpdateDock();
    });
  }

  /// update cameraposition
  void _updateCameraPosition() {
    cameraPosition = CameraPosition(target: currentPosition, zoom: 15, tilt: 5);
  }

  /// update the live camera position
  void _updateLiveCameraPosition() {
    if (recenter) {
      controller?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  void reRoute() {
    Navigator.of(context).pop(true);
  }

  /// Update route
  Future updateRoute() async {
    if (isAtGoal) {
      reRoute();
      return;
    }
    double distance =
        calculateDistance(currentPosition, _journey[currentStation]);
    if (distance < 0.02) {
      ++currentStation;
      if (currentStation >= _journey.length) {
        isAtGoal = true;
        return;
      }
      this.dockName.value = _itinerary.docks![currentStation].name;
    }
    // removePolylineMarkers(controller!, _journey, _polylineSymbols);
    removeMarkers(controller!, _polylineSymbols);
    removeFills(controller, _polylineSymbols, fills);
    _displayJourney();
  }

  /// display route
  void _displayJourney() {
    setRoute();
    setLocationMarkers(
        controller!, _journey, _polylineSymbols); //setPolylineMarkers
  }

  /// set the route
  Future setRoute() async {
    _journeyPoints = [];
    await _setRouteType();
    manager.setDistance(_routeResponse['distance'].toDouble());
    manager.setDuration(_routeResponse['duration'].toDouble());
    manager.setGeometry(_routeResponse['geometry']);

    displayJourney();
  }

  /// sets the next section of the bike route
  Future<void> _setRouteType() async {
    if (currentStation >= _journey.length) {
      return;
    }
    if (currentStation > 0) {
      await _setInitRoute(NavigationType.cycling);
    } else {
      await _setInitRoute(NavigationType.walking);
    }
    manager.setGeometry(_routeResponse['geometry']);
  }

  /// sets the route
  Future<void> _setInitRoute(NavigationType type) async {
    _routeResponse = await manager.getDirections(
        currentPosition, _journey[currentStation], type);
    //update local vars ---
    num distance = await manager.getDistance() as num;
    num duration = await manager.getDuration() as num;
    for (dynamic a in _routeResponse['geometry']!['coordinates']) {
      _journeyPoints.add(a);
    }
    final prefDistance = sharedPreferences.getDouble('distance');
    sharedPreferences.setDouble(
        'distance',
        (prefDistance ?? 0) +
            (this.distance.value - distance).abs().toDouble());
    this.distance.value = distance;
    this.duration.value = duration;
    _routeResponse['geometry'].update("coordinates", (value) => _journeyPoints);
  }

  /// updates our camera position to not zoom on us
  @override
  void onMapClick(Point<double> point, LatLng coordinates) async {
    recenter = false;
  }
}
