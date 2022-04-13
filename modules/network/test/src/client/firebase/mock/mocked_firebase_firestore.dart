import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';

// ignore: subtype_of_sealed_class
class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

class MockedFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockedMap<K, V> extends Mock implements Map<K, V> {
  void mockValue({dynamic expected = const <String, dynamic>{}}) {
    when<dynamic>(() => this[any()]).thenReturn(expected);
  }
}
