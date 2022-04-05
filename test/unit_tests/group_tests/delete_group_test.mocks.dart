// Mocks generated by Mockito 5.1.0 from annotations
// in veloplan/test/unit_tests/group_tests/delete_group_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:veloplan/helpers/database_helpers/database_manager.dart' as _i5;
import 'package:veloplan/models/itinerary.dart' as _i4;
import 'package:veloplan/models/itinerary_manager.dart' as _i8;
import 'package:veloplan/models/path.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCollectionReference_0<T extends Object?> extends _i1.Fake
    implements _i2.CollectionReference<T> {}

class _FakeQuerySnapshot_1<T extends Object?> extends _i1.Fake
    implements _i2.QuerySnapshot<T> {}

class _FakeDocumentSnapshot_2<T extends Object?> extends _i1.Fake
    implements _i2.DocumentSnapshot<T> {}

class _FakeDocumentReference_3<T extends Object?> extends _i1.Fake
    implements _i2.DocumentReference<T> {}

class _FakeUserMetadata_4 extends _i1.Fake implements _i3.UserMetadata {}

class _FakeIdTokenResult_5 extends _i1.Fake implements _i3.IdTokenResult {}

class _FakeUserCredential_6 extends _i1.Fake implements _i3.UserCredential {}

class _FakeConfirmationResult_7 extends _i1.Fake
    implements _i3.ConfirmationResult {}

class _FakeUser_8 extends _i1.Fake implements _i3.User {}

class _FakeSnapshotMetadata_9 extends _i1.Fake implements _i2.SnapshotMetadata {
}

class _FakeFirebaseFirestore_10 extends _i1.Fake
    implements _i2.FirebaseFirestore {}

class _FakeQuery_11<T extends Object?> extends _i1.Fake
    implements _i2.Query<T> {}

class _FakeItinerary_12 extends _i1.Fake implements _i4.Itinerary {}

/// A class which mocks [DatabaseManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseManager extends _i1.Mock implements _i5.DatabaseManager {
  MockDatabaseManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CollectionReference<Object?> getUserSubCollectionReference(
          String? collectionName) =>
      (super.noSuchMethod(
          Invocation.method(#getUserSubCollectionReference, [collectionName]),
          returnValue:
              _FakeCollectionReference_0<Object?>()) as _i2
          .CollectionReference<Object?>);
  @override
  _i6.Future<_i2.QuerySnapshot<Object?>> getUserSubcollection(
          String? subcollection) =>
      (super.noSuchMethod(
              Invocation.method(#getUserSubcollection, [subcollection]),
              returnValue: Future<_i2.QuerySnapshot<Object?>>.value(
                  _FakeQuerySnapshot_1<Object?>()))
          as _i6.Future<_i2.QuerySnapshot<Object?>>);
  @override
  _i6.Future<dynamic> deleteCollection(
          _i2.CollectionReference<Object?>? collection) =>
      (super.noSuchMethod(Invocation.method(#deleteCollection, [collection]),
          returnValue: Future<dynamic>.value()) as _i6.Future<dynamic>);
  @override
  _i6.Future<void> deleteDocument(
          _i2.CollectionReference<Object?>? collection, String? documentId) =>
      (super.noSuchMethod(
          Invocation.method(#deleteDocument, [collection, documentId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i2.QuerySnapshot<Map<String, dynamic>>> getByEquality(
          String? collection, String? field, String? equalTo) =>
      (super.noSuchMethod(
          Invocation.method(#getByEquality, [collection, field, equalTo]),
          returnValue: Future<_i2.QuerySnapshot<Map<String, dynamic>>>.value(
              _FakeQuerySnapshot_1<Map<String, dynamic>>())) as _i6
          .Future<_i2.QuerySnapshot<Map<String, dynamic>>>);
  @override
  _i6.Future<_i2.DocumentSnapshot<Map<String, dynamic>>> getByKey(
          String? collection, String? key) =>
      (super.noSuchMethod(Invocation.method(#getByKey, [collection, key]),
          returnValue: Future<_i2.DocumentSnapshot<Map<String, dynamic>>>.value(
              _FakeDocumentSnapshot_2<Map<String, dynamic>>())) as _i6
          .Future<_i2.DocumentSnapshot<Map<String, dynamic>>>);
  @override
  _i6.Future<void> setByKey(
          String? collection, String? key, Map<String, dynamic>? value,
          [_i2.SetOptions? options]) =>
      (super.noSuchMethod(
          Invocation.method(#setByKey, [collection, key, value, options]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updateByKey(
          String? collection, String? key, Map<String, dynamic>? value) =>
      (super.noSuchMethod(
          Invocation.method(#updateByKey, [collection, key, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i2.DocumentReference<Map<String, dynamic>>> addToCollection(
          String? collection, Map<String, dynamic>? value) =>
      (super.noSuchMethod(
              Invocation.method(#addToCollection, [collection, value]),
              returnValue:
                  Future<_i2.DocumentReference<Map<String, dynamic>>>.value(
                      _FakeDocumentReference_3<Map<String, dynamic>>()))
          as _i6.Future<_i2.DocumentReference<Map<String, dynamic>>>);
  @override
  _i6.Future<_i2.DocumentReference<Object?>> addToSubCollection(
          _i2.CollectionReference<Object?>? subcollection,
          Map<String, dynamic>? value) =>
      (super.noSuchMethod(
              Invocation.method(#addToSubCollection, [subcollection, value]),
              returnValue: Future<_i2.DocumentReference<Object?>>.value(
                  _FakeDocumentReference_3<Object?>()))
          as _i6.Future<_i2.DocumentReference<Object?>>);
  @override
  _i6.Future<void> addSubCollectiontoCollectionByDocumentId(
          dynamic documentId,
          String? newSubollection,
          _i2.CollectionReference<Object?>? subcollection,
          Map<String, dynamic>? value) =>
      (super.noSuchMethod(
          Invocation.method(#addSubCollectiontoSubCollectionByDocumentId,
              [documentId, newSubollection, subcollection, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setSubCollectionByDocumentId(
          String? documentId,
          _i2.CollectionReference<Object?>? subcollection,
          Map<String, dynamic>? value) =>
      (super.noSuchMethod(
          Invocation.method(#setSubCollectionByDocumentId,
              [documentId, subcollection, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i2.QuerySnapshot<Map<String, dynamic>>>
      getDocumentsFromSubCollection(
              _i2.CollectionReference<Object?>? collection,
              dynamic documentId,
              String? subcollection) =>
          (super.noSuchMethod(
                  Invocation.method(#getDocumentsFromSubCollection, [
                    collection,
                    documentId,
                    subcollection
                  ]),
                  returnValue:
                      Future<_i2.QuerySnapshot<Map<String, dynamic>>>.value(
                          _FakeQuerySnapshot_1<Map<String, dynamic>>()))
              as _i6.Future<_i2.QuerySnapshot<Map<String, dynamic>>>);
  @override
  _i6.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i3.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get emailVerified =>
      (super.noSuchMethod(Invocation.getter(#emailVerified), returnValue: false)
          as bool);
  @override
  bool get isAnonymous =>
      (super.noSuchMethod(Invocation.getter(#isAnonymous), returnValue: false)
          as bool);
  @override
  _i3.UserMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeUserMetadata_4()) as _i3.UserMetadata);
  @override
  List<_i3.UserInfo> get providerData =>
      (super.noSuchMethod(Invocation.getter(#providerData),
          returnValue: <_i3.UserInfo>[]) as List<_i3.UserInfo>);
  @override
  String get uid =>
      (super.noSuchMethod(Invocation.getter(#uid), returnValue: '') as String);
  @override
  _i6.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String> getIdToken([bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdToken, [forceRefresh]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i3.IdTokenResult> getIdTokenResult(
          [bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdTokenResult, [forceRefresh]),
              returnValue:
                  Future<_i3.IdTokenResult>.value(_FakeIdTokenResult_5()))
          as _i6.Future<_i3.IdTokenResult>);
  @override
  _i6.Future<_i3.UserCredential> linkWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#linkWithCredential, [credential]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_6()))
          as _i6.Future<_i3.UserCredential>);
  @override
  _i6.Future<_i3.UserCredential> linkWithPopup(_i7.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#linkWithPopup, [provider]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_6()))
          as _i6.Future<_i3.UserCredential>);
  @override
  _i6.Future<_i3.ConfirmationResult> linkWithPhoneNumber(String? phoneNumber,
          [_i3.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
              Invocation.method(#linkWithPhoneNumber, [phoneNumber, verifier]),
              returnValue: Future<_i3.ConfirmationResult>.value(
                  _FakeConfirmationResult_7()))
          as _i6.Future<_i3.ConfirmationResult>);
  @override
  _i6.Future<_i3.UserCredential> reauthenticateWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#reauthenticateWithCredential, [credential]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_6()))
          as _i6.Future<_i3.UserCredential>);
  @override
  _i6.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> sendEmailVerification(
          [_i3.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#sendEmailVerification, [actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.User> unlink(String? providerId) =>
      (super.noSuchMethod(Invocation.method(#unlink, [providerId]),
              returnValue: Future<_i3.User>.value(_FakeUser_8()))
          as _i6.Future<_i3.User>);
  @override
  _i6.Future<void> updateEmail(String? newEmail) =>
      (super.noSuchMethod(Invocation.method(#updateEmail, [newEmail]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updatePassword(String? newPassword) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [newPassword]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updatePhoneNumber(
          _i3.PhoneAuthCredential? phoneCredential) =>
      (super.noSuchMethod(
          Invocation.method(#updatePhoneNumber, [phoneCredential]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updateDisplayName(String? displayName) =>
      (super.noSuchMethod(Invocation.method(#updateDisplayName, [displayName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updatePhotoURL(String? photoURL) =>
      (super.noSuchMethod(Invocation.method(#updatePhotoURL, [photoURL]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updateProfile({String? displayName, String? photoURL}) =>
      (super.noSuchMethod(
          Invocation.method(#updateProfile, [],
              {#displayName: displayName, #photoURL: photoURL}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> verifyBeforeUpdateEmail(String? newEmail,
          [_i3.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(
              #verifyBeforeUpdateEmail, [newEmail, actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [QuerySnapshot].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuerySnapshot<T extends Object?> extends _i1.Mock
    implements _i2.QuerySnapshot<T> {
  MockQuerySnapshot() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.QueryDocumentSnapshot<T>> get docs =>
      (super.noSuchMethod(Invocation.getter(#docs),
              returnValue: <_i2.QueryDocumentSnapshot<T>>[])
          as List<_i2.QueryDocumentSnapshot<T>>);
  @override
  List<_i2.DocumentChange<T>> get docChanges => (super.noSuchMethod(
      Invocation.getter(#docChanges),
      returnValue: <_i2.DocumentChange<T>>[]) as List<_i2.DocumentChange<T>>);
  @override
  _i2.SnapshotMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeSnapshotMetadata_9()) as _i2.SnapshotMetadata);
  @override
  int get size =>
      (super.noSuchMethod(Invocation.getter(#size), returnValue: 0) as int);
}

/// A class which mocks [DocumentReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockDocumentReference<T extends Object?> extends _i1.Mock
    implements _i2.DocumentReference<T> {
  MockDocumentReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore),
          returnValue: _FakeFirebaseFirestore_10()) as _i2.FirebaseFirestore);
  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  _i2.CollectionReference<T> get parent =>
      (super.noSuchMethod(Invocation.getter(#parent),
              returnValue: _FakeCollectionReference_0<T>())
          as _i2.CollectionReference<T>);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  _i2.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionPath]),
              returnValue: _FakeCollectionReference_0<Map<String, dynamic>>())
          as _i2.CollectionReference<Map<String, dynamic>>);
  @override
  _i6.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> update(Map<String, Object?>? data) =>
      (super.noSuchMethod(Invocation.method(#update, [data]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i2.DocumentSnapshot<T>> get([_i2.GetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#get, [options]),
              returnValue: Future<_i2.DocumentSnapshot<T>>.value(
                  _FakeDocumentSnapshot_2<T>()))
          as _i6.Future<_i2.DocumentSnapshot<T>>);
  @override
  _i6.Stream<_i2.DocumentSnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
              Invocation.method(#snapshots, [],
                  {#includeMetadataChanges: includeMetadataChanges}),
              returnValue: Stream<_i2.DocumentSnapshot<T>>.empty())
          as _i6.Stream<_i2.DocumentSnapshot<T>>);
  @override
  _i6.Future<void> set(T? data, [_i2.SetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#set, [data, options]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i2.DocumentReference<R> withConverter<R>(
          {_i2.FromFirestore<R>? fromFirestore,
          _i2.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
              Invocation.method(#withConverter, [],
                  {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
              returnValue: _FakeDocumentReference_3<R>())
          as _i2.DocumentReference<R>);
}

/// A class which mocks [CollectionReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockCollectionReference<T extends Object?> extends _i1.Mock
    implements _i2.CollectionReference<T> {
  MockCollectionReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  _i2.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore),
          returnValue: _FakeFirebaseFirestore_10()) as _i2.FirebaseFirestore);
  @override
  Map<String, dynamic> get parameters =>
      (super.noSuchMethod(Invocation.getter(#parameters),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  _i6.Future<_i2.DocumentReference<T>> add(T? data) =>
      (super.noSuchMethod(Invocation.method(#add, [data]),
              returnValue: Future<_i2.DocumentReference<T>>.value(
                  _FakeDocumentReference_3<T>()))
          as _i6.Future<_i2.DocumentReference<T>>);
  @override
  _i2.DocumentReference<T> doc([String? path]) => (super.noSuchMethod(
      Invocation.method(#doc, [path]),
      returnValue: _FakeDocumentReference_3<T>()) as _i2.DocumentReference<T>);
  @override
  _i2.CollectionReference<R> withConverter<R extends Object?>(
          {_i2.FromFirestore<R>? fromFirestore,
          _i2.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
              Invocation.method(#withConverter, [],
                  {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
              returnValue: _FakeCollectionReference_0<R>())
          as _i2.CollectionReference<R>);
  @override
  _i2.Query<T> endAtDocument(_i2.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(Invocation.method(#endAtDocument, [documentSnapshot]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> endAt(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#endAt, [values]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> endBeforeDocument(
          _i2.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
          Invocation.method(#endBeforeDocument, [documentSnapshot]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> endBefore(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#endBefore, [values]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i6.Future<_i2.QuerySnapshot<T>> get([_i2.GetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#get, [options]),
              returnValue:
                  Future<_i2.QuerySnapshot<T>>.value(_FakeQuerySnapshot_1<T>()))
          as _i6.Future<_i2.QuerySnapshot<T>>);
  @override
  _i2.Query<T> limit(int? limit) =>
      (super.noSuchMethod(Invocation.method(#limit, [limit]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> limitToLast(int? limit) =>
      (super.noSuchMethod(Invocation.method(#limitToLast, [limit]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i6.Stream<_i2.QuerySnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
              Invocation.method(#snapshots, [],
                  {#includeMetadataChanges: includeMetadataChanges}),
              returnValue: Stream<_i2.QuerySnapshot<T>>.empty())
          as _i6.Stream<_i2.QuerySnapshot<T>>);
  @override
  _i2.Query<T> orderBy(Object? field, {bool? descending = false}) =>
      (super.noSuchMethod(
          Invocation.method(#orderBy, [field], {#descending: descending}),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> startAfterDocument(
          _i2.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
          Invocation.method(#startAfterDocument, [documentSnapshot]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> startAfter(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#startAfter, [values]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> startAtDocument(
          _i2.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
          Invocation.method(#startAtDocument, [documentSnapshot]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> startAt(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#startAt, [values]),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
  @override
  _i2.Query<T> where(Object? field,
          {Object? isEqualTo,
          Object? isNotEqualTo,
          Object? isLessThan,
          Object? isLessThanOrEqualTo,
          Object? isGreaterThan,
          Object? isGreaterThanOrEqualTo,
          Object? arrayContains,
          List<Object?>? arrayContainsAny,
          List<Object?>? whereIn,
          List<Object?>? whereNotIn,
          bool? isNull}) =>
      (super.noSuchMethod(
          Invocation.method(#where, [
            field
          ], {
            #isEqualTo: isEqualTo,
            #isNotEqualTo: isNotEqualTo,
            #isLessThan: isLessThan,
            #isLessThanOrEqualTo: isLessThanOrEqualTo,
            #isGreaterThan: isGreaterThan,
            #isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
            #arrayContains: arrayContains,
            #arrayContainsAny: arrayContainsAny,
            #whereIn: whereIn,
            #whereNotIn: whereNotIn,
            #isNull: isNull
          }),
          returnValue: _FakeQuery_11<T>()) as _i2.Query<T>);
}

/// A class which mocks [ItineraryManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockItineraryManager extends _i1.Mock implements _i8.ItineraryManager {
  MockItineraryManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i9.Path> getPaths() =>
      (super.noSuchMethod(Invocation.method(#getPaths, []),
          returnValue: <_i9.Path>[]) as List<_i9.Path>);
  @override
  _i4.Itinerary getItinerary() =>
      (super.noSuchMethod(Invocation.method(#getItinerary, []),
          returnValue: _FakeItinerary_12()) as _i4.Itinerary);
  @override
  void printPaths() => super.noSuchMethod(Invocation.method(#printPaths, []),
      returnValueForMissingStub: null);
  @override
  void updatePath(_i9.Path? newPath) =>
      super.noSuchMethod(Invocation.method(#updatePath, [newPath]),
          returnValueForMissingStub: null);
  @override
  void setIndex(int? i) => super.noSuchMethod(Invocation.method(#setIndex, [i]),
      returnValueForMissingStub: null);
  @override
  int getIndex() =>
      (super.noSuchMethod(Invocation.method(#getIndex, []), returnValue: 0)
          as int);
}
