// // Mocks generated by Mockito 5.1.0 from annotations
// // in veloplan/test/unit_tests/create_group_test.dart.
// // Do not manually edit this file.

// import 'dart:async' as _i5;

// import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
// import 'package:firebase_auth/firebase_auth.dart' as _i3;
// import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
//     as _i6;
// import 'package:mockito/mockito.dart' as _i1;
// import 'package:veloplan/helpers/database_helpers/database_manager.dart' as _i4;

// // ignore_for_file: type=lint
// // ignore_for_file: avoid_redundant_argument_values
// // ignore_for_file: avoid_setters_without_getters
// // ignore_for_file: comment_references
// // ignore_for_file: implementation_imports
// // ignore_for_file: invalid_use_of_visible_for_testing_member
// // ignore_for_file: prefer_const_constructors
// // ignore_for_file: unnecessary_parenthesis
// // ignore_for_file: camel_case_types

// class _FakeCollectionReference_0<T extends Object?> extends _i1.Fake
//     implements _i2.CollectionReference<T> {}

// class _FakeQuerySnapshot_1<T extends Object?> extends _i1.Fake
//     implements _i2.QuerySnapshot<T> {}

// class _FakeDocumentSnapshot_2<T extends Object?> extends _i1.Fake
//     implements _i2.DocumentSnapshot<T> {}

// class _FakeUserMetadata_3 extends _i1.Fake implements _i3.UserMetadata {}

// class _FakeIdTokenResult_4 extends _i1.Fake implements _i3.IdTokenResult {}

// class _FakeUserCredential_5 extends _i1.Fake implements _i3.UserCredential {}

// class _FakeConfirmationResult_6 extends _i1.Fake
//     implements _i3.ConfirmationResult {}

// class _FakeUser_7 extends _i1.Fake implements _i3.User {}

// class _FakeSnapshotMetadata_8 extends _i1.Fake implements _i2.SnapshotMetadata {
// }

// /// A class which mocks [DatabaseManager].
// ///
// /// See the documentation for Mockito's code generation for more information.
// class MockDatabaseManager extends _i1.Mock implements _i4.DatabaseManager {
//   MockDatabaseManager() {
//     _i1.throwOnMissingStub(this);
//   }

//   @override
//   _i2.CollectionReference<Object?> getUserSubCollectionReference(
//           String? collectionName) =>
//       (super.noSuchMethod(
//           Invocation.method(#getUserSubCollectionReference, [collectionName]),
//           returnValue:
//               _FakeCollectionReference_0<Object?>()) as _i2
//           .CollectionReference<Object?>);
//   @override
//   _i5.Future<_i2.QuerySnapshot<Object?>> getUserSubcollection(
//           String? subcollection) =>
//       (super.noSuchMethod(
//               Invocation.method(#getUserSubcollection, [subcollection]),
//               returnValue: Future<_i2.QuerySnapshot<Object?>>.value(
//                   _FakeQuerySnapshot_1<Object?>()))
//           as _i5.Future<_i2.QuerySnapshot<Object?>>);
//   @override
//   _i5.Future<dynamic> deleteCollection(
//           _i2.CollectionReference<Object?>? collection) =>
//       (super.noSuchMethod(Invocation.method(#deleteCollection, [collection]),
//           returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
//   @override
//   _i5.Future<void> deleteDocument(
//           _i2.CollectionReference<Object?>? collection, String? documentId) =>
//       (super.noSuchMethod(
//           Invocation.method(#deleteDocument, [collection, documentId]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<_i2.QuerySnapshot<Map<String, dynamic>>> getByEquality(
//           String? collection, String? field, String? equalTo) =>
//       (super.noSuchMethod(
//           Invocation.method(#getByEquality, [collection, field, equalTo]),
//           returnValue: Future<_i2.QuerySnapshot<Map<String, dynamic>>>.value(
//               _FakeQuerySnapshot_1<Map<String, dynamic>>())) as _i5
//           .Future<_i2.QuerySnapshot<Map<String, dynamic>>>);
//   @override
//   _i5.Future<_i2.DocumentSnapshot<Map<String, dynamic>>> getByKey(
//           String? collection, String? key) =>
//       (super.noSuchMethod(Invocation.method(#getByKey, [collection, key]),
//           returnValue: Future<_i2.DocumentSnapshot<Map<String, dynamic>>>.value(
//               _FakeDocumentSnapshot_2<Map<String, dynamic>>())) as _i5
//           .Future<_i2.DocumentSnapshot<Map<String, dynamic>>>);
//   @override
//   _i5.Future<void> setByKey(
//           String? collection, String? key, Map<String, dynamic>? value,
//           [_i2.SetOptions? options]) =>
//       (super.noSuchMethod(
//           Invocation.method(#setByKey, [collection, key, value, options]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> updateByKey(
//           String? collection, String? key, Map<String, dynamic>? value) =>
//       (super.noSuchMethod(
//           Invocation.method(#updateByKey, [collection, key, value]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> addToCollection(
//           String? collection, Map<String, dynamic>? value) =>
//       (super.noSuchMethod(
//           Invocation.method(#addToCollection, [collection, value]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> addToSubCollection(
//           _i2.CollectionReference<Object?>? subcollection,
//           Map<String, dynamic>? value) =>
//       (super.noSuchMethod(
//           Invocation.method(#addToSubCollection, [subcollection, value]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> signOut() =>
//       (super.noSuchMethod(Invocation.method(#signOut, []),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
// }

// /// A class which mocks [User].
// ///
// /// See the documentation for Mockito's code generation for more information.
// class MockUser extends _i1.Mock implements _i3.User {
//   MockUser() {
//     _i1.throwOnMissingStub(this);
//   }

//   @override
//   bool get emailVerified =>
//       (super.noSuchMethod(Invocation.getter(#emailVerified), returnValue: false)
//           as bool);
//   @override
//   bool get isAnonymous =>
//       (super.noSuchMethod(Invocation.getter(#isAnonymous), returnValue: false)
//           as bool);
//   @override
//   _i3.UserMetadata get metadata =>
//       (super.noSuchMethod(Invocation.getter(#metadata),
//           returnValue: _FakeUserMetadata_3()) as _i3.UserMetadata);
//   @override
//   List<_i3.UserInfo> get providerData =>
//       (super.noSuchMethod(Invocation.getter(#providerData),
//           returnValue: <_i3.UserInfo>[]) as List<_i3.UserInfo>);
//   @override
//   String get uid =>
//       (super.noSuchMethod(Invocation.getter(#uid), returnValue: '') as String);
//   @override
//   _i5.Future<void> delete() =>
//       (super.noSuchMethod(Invocation.method(#delete, []),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<String> getIdToken([bool? forceRefresh = false]) =>
//       (super.noSuchMethod(Invocation.method(#getIdToken, [forceRefresh]),
//           returnValue: Future<String>.value('')) as _i5.Future<String>);
//   @override
//   _i5.Future<_i3.IdTokenResult> getIdTokenResult(
//           [bool? forceRefresh = false]) =>
//       (super.noSuchMethod(Invocation.method(#getIdTokenResult, [forceRefresh]),
//               returnValue:
//                   Future<_i3.IdTokenResult>.value(_FakeIdTokenResult_4()))
//           as _i5.Future<_i3.IdTokenResult>);
//   @override
//   _i5.Future<_i3.UserCredential> linkWithCredential(
//           _i3.AuthCredential? credential) =>
//       (super.noSuchMethod(Invocation.method(#linkWithCredential, [credential]),
//               returnValue:
//                   Future<_i3.UserCredential>.value(_FakeUserCredential_5()))
//           as _i5.Future<_i3.UserCredential>);
//   @override
//   _i5.Future<_i3.UserCredential> linkWithPopup(_i6.AuthProvider? provider) =>
//       (super.noSuchMethod(Invocation.method(#linkWithPopup, [provider]),
//               returnValue:
//                   Future<_i3.UserCredential>.value(_FakeUserCredential_5()))
//           as _i5.Future<_i3.UserCredential>);
//   @override
//   _i5.Future<_i3.ConfirmationResult> linkWithPhoneNumber(String? phoneNumber,
//           [_i3.RecaptchaVerifier? verifier]) =>
//       (super.noSuchMethod(
//               Invocation.method(#linkWithPhoneNumber, [phoneNumber, verifier]),
//               returnValue: Future<_i3.ConfirmationResult>.value(
//                   _FakeConfirmationResult_6()))
//           as _i5.Future<_i3.ConfirmationResult>);
//   @override
//   _i5.Future<_i3.UserCredential> reauthenticateWithCredential(
//           _i3.AuthCredential? credential) =>
//       (super.noSuchMethod(
//               Invocation.method(#reauthenticateWithCredential, [credential]),
//               returnValue:
//                   Future<_i3.UserCredential>.value(_FakeUserCredential_5()))
//           as _i5.Future<_i3.UserCredential>);
//   @override
//   _i5.Future<void> reload() =>
//       (super.noSuchMethod(Invocation.method(#reload, []),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> sendEmailVerification(
//           [_i3.ActionCodeSettings? actionCodeSettings]) =>
//       (super.noSuchMethod(
//           Invocation.method(#sendEmailVerification, [actionCodeSettings]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<_i3.User> unlink(String? providerId) =>
//       (super.noSuchMethod(Invocation.method(#unlink, [providerId]),
//               returnValue: Future<_i3.User>.value(_FakeUser_7()))
//           as _i5.Future<_i3.User>);
//   @override
//   _i5.Future<void> updateEmail(String? newEmail) =>
//       (super.noSuchMethod(Invocation.method(#updateEmail, [newEmail]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> updatePassword(String? newPassword) =>
//       (super.noSuchMethod(Invocation.method(#updatePassword, [newPassword]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> updatePhoneNumber(
//           _i3.PhoneAuthCredential? phoneCredential) =>
//       (super.noSuchMethod(
//           Invocation.method(#updatePhoneNumber, [phoneCredential]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> updateDisplayName(String? displayName) =>
//       (super.noSuchMethod(Invocation.method(#updateDisplayName, [displayName]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> updatePhotoURL(String? photoURL) =>
//       (super.noSuchMethod(Invocation.method(#updatePhotoURL, [photoURL]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> updateProfile({String? displayName, String? photoURL}) =>
//       (super.noSuchMethod(
//           Invocation.method(#updateProfile, [],
//               {#displayName: displayName, #photoURL: photoURL}),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
//   @override
//   _i5.Future<void> verifyBeforeUpdateEmail(String? newEmail,
//           [_i3.ActionCodeSettings? actionCodeSettings]) =>
//       (super.noSuchMethod(
//           Invocation.method(
//               #verifyBeforeUpdateEmail, [newEmail, actionCodeSettings]),
//           returnValue: Future<void>.value(),
//           returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
// }

// /// A class which mocks [QuerySnapshot].
// ///
// /// See the documentation for Mockito's code generation for more information.
// class MockQuerySnapshot<T extends Object?> extends _i1.Mock
//     implements _i2.QuerySnapshot<T> {
//   MockQuerySnapshot() {
//     _i1.throwOnMissingStub(this);
//   }

//   @override
//   List<_i2.QueryDocumentSnapshot<T>> get docs =>
//       (super.noSuchMethod(Invocation.getter(#docs),
//               returnValue: <_i2.QueryDocumentSnapshot<T>>[])
//           as List<_i2.QueryDocumentSnapshot<T>>);
//   @override
//   List<_i2.DocumentChange<T>> get docChanges => (super.noSuchMethod(
//       Invocation.getter(#docChanges),
//       returnValue: <_i2.DocumentChange<T>>[]) as List<_i2.DocumentChange<T>>);
//   @override
//   _i2.SnapshotMetadata get metadata =>
//       (super.noSuchMethod(Invocation.getter(#metadata),
//           returnValue: _FakeSnapshotMetadata_8()) as _i2.SnapshotMetadata);
//   @override
//   int get size =>
//       (super.noSuchMethod(Invocation.getter(#size), returnValue: 0) as int);
// }
