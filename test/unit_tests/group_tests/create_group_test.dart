import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veloplan/helpers/database_helpers/database_manager.dart';
import 'package:veloplan/helpers/database_helpers/group_manager.dart';
import 'package:veloplan/helpers/navigation_helpers/navigation_conversions_helpers.dart';
import 'package:veloplan/models/docking_station.dart';
import 'package:veloplan/models/itinerary.dart';
import 'package:veloplan/providers/itinerary_manager.dart';
import 'package:veloplan/models/path.dart';
import 'create_group_test.mocks.dart';

@GenerateMocks([DatabaseManager, User,QuerySnapshot<Map<String, dynamic>>, DocumentReference<Map<String, dynamic>>, CollectionReference<Map<String, dynamic>>, ItineraryManager])
void main() {

  late MockItineraryManager itManager;
  late MockDatabaseManager mockDBManagager;
  late Itinerary _itinerary;
  late MockUser user;
  late groupManager _groupManager;

  var docks = [DockingStation("test1", 'test1', true, false, 2, 2, 4, 20, 30),DockingStation("test2", 'test2', true, false, 2, 2, 4, 10, 10) ];

  setUp(() {
    var numberOfCyclists = 2;
    var points = [LatLng(20, 30),LatLng(10, 10)];
    var path = [Path(DockingStation("test1", 'test1', true, false, 2, 2, 4, 20, 30), DockingStation("test2", 'test2', true, false, 2, 2, 4, 10, 10), LatLng(20, 30), LatLng(10, 10))];
    user = MockUser();
    _itinerary = Itinerary.navigation(docks, points, numberOfCyclists);
    itManager = MockItineraryManager();
    mockDBManagager = MockDatabaseManager();
    when(itManager.getItinerary()).thenReturn(_itinerary);
    when(itManager.getPaths()).thenReturn(path);
    _groupManager =  groupManager(mockDBManagager);
  });

  test('Creating group works', () async {
    DocumentReference<Map<String, dynamic>> group = MockDocumentReference();
    DocumentReference<Map<String, dynamic>>  journey = MockDocumentReference();
    CollectionReference<Map<String, dynamic>> groupRef = MockCollectionReference();
    CollectionReference<Map<String, dynamic>> dockingRef = MockCollectionReference();
    CollectionReference<Map<String, dynamic>> coordinatesRef = MockCollectionReference();
    QuerySnapshot<Map<String, dynamic>> groupResponse =MockQuerySnapshot();
    List<GeoPoint> geoList = [];
    var destinationsInDouble = convertLatLngToDouble(_itinerary.myDestinations!);
    for (int i = 0; i < destinationsInDouble!.length; i++) {
      geoList.add(
          GeoPoint(destinationsInDouble[i]![0]!, destinationsInDouble[i]![1]!));
    }

    String testID = "testingID";
    List listOfAnswers = [2,0];

    when(user.uid).thenReturn(testID);
    when(mockDBManagager.getCurrentUser()).thenReturn(user);
    when(mockDBManagager.getByEquality('group', 'code', any)).thenAnswer((_) async => groupResponse);
    when(groupResponse.size)
        .thenAnswer((_) => listOfAnswers.removeAt(0));
    when(mockDBManagager.addToSubCollection(dockingRef, any)).thenAnswer((_) async => journey);

    when(mockDBManagager.addToSubCollection(coordinatesRef, any)).thenAnswer((_) async => journey);
    when(mockDBManagager.addToCollection('group', any)).thenAnswer((_) async => group);
    when(group.collection("itinerary")).thenAnswer((_) => groupRef);
    when(mockDBManagager.setByKey('users', testID, any, any)).thenAnswer((_)async => null);
    when(groupRef.add({
      'journeyID': _itinerary.journeyDocumentId,
      'points': geoList,
      'date': _itinerary.date,
      'numberOfCyclists': _itinerary.numberOfCyclists
    })).thenAnswer((_) async => journey);
    when(journey.collection('coordinates')).thenAnswer((_) => coordinatesRef);
    when(journey.collection('dockingStations')).thenAnswer((_) => dockingRef);

    await _groupManager.createGroup(_itinerary);
    verify(mockDBManagager.getByEquality('group', 'code', any)).called(2);
    verify(mockDBManagager.addToCollection('group', any)).called(1);
    verify(mockDBManagager.addToSubCollection(coordinatesRef, any)).called(geoList.length);
    verify(mockDBManagager.addToSubCollection(dockingRef, any)).called(docks.length);
    verify(mockDBManagager.setByKey('users', testID, any, any)).called(1);

  });

  test('Creating group works', () async {
    DocumentReference<Map<String, dynamic>> group = MockDocumentReference();
    DocumentReference<Map<String, dynamic>>  journey = MockDocumentReference();
    CollectionReference<Map<String, dynamic>> groupRef = MockCollectionReference();
    CollectionReference<Map<String, dynamic>> dockingRef = MockCollectionReference();
    CollectionReference<Map<String, dynamic>> coordinatesRef = MockCollectionReference();
    QuerySnapshot<Map<String, dynamic>> groupResponse =MockQuerySnapshot();
    List<GeoPoint> geoList = [];
    var destinationsIndouble = convertLatLngToDouble(_itinerary.myDestinations!);
    for (int i = 0; i < destinationsIndouble!.length; i++) {
      geoList.add(
          GeoPoint(destinationsIndouble[i]![0]!, destinationsIndouble[i]![1]!));
    }

    String testID = "testingID";

    when(user.uid).thenReturn(testID);
    when(mockDBManagager.getCurrentUser()).thenReturn(user);
    when(mockDBManagager.getByEquality('group', 'code', any)).thenAnswer((_) async => groupResponse);
    when(groupResponse.size).thenReturn(0);
    when(mockDBManagager.addToSubCollection(dockingRef, any)).thenAnswer((_) async => journey);

    when(mockDBManagager.addToSubCollection(coordinatesRef, any)).thenAnswer((_) async => journey);
    when(mockDBManagager.addToCollection('group', any)).thenAnswer((_) async => group);
    when(group.collection("itinerary")).thenAnswer((_) => groupRef);
    when(mockDBManagager.setByKey('users', testID, any, any)).thenAnswer((_)async => null);
    when(groupRef.add({
      'journeyID': _itinerary.journeyDocumentId,
      'points': geoList,
      'date': _itinerary.date,
      'numberOfCyclists': _itinerary.numberOfCyclists
    })).thenAnswer((_) async => journey);
    when(journey.collection('coordinates')).thenAnswer((_) => coordinatesRef);
    when(journey.collection('dockingStations')).thenAnswer((_) => dockingRef);

    await _groupManager.createGroup(_itinerary);

    verify(mockDBManagager.addToCollection('group', any)).called(1);
    verify(mockDBManagager.addToSubCollection(coordinatesRef, any)).called(geoList.length);
    verify(mockDBManagager.addToSubCollection(dockingRef, any)).called(docks.length);
    verify(mockDBManagager.setByKey('users', testID, any, any)).called(1);

  });

}
