import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/src/client/client.dart';
import 'package:network/src/entity/entity.dart';
import 'package:network/src/exception/exceptions.dart';

import 'mock/mocked_firebase_firestore.dart';

void main() {
  group(FireStoreClient, () {
    late MockedFirebaseFirestore mockedFirebaseFirestore;
    late MockDocumentSnapshot mockDocumentSnapshot;
    late MockCollectionReference mockCollectionReference;
    late MockDocumentReference mockDocumentReference;

    late FireStoreClient fireStoreClient;

    setUp(() {
      mockedFirebaseFirestore = MockedFirebaseFirestore();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockCollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();

      fireStoreClient = FireStoreClient(mockedFirebaseFirestore);
    });

    group('fetchPokedex', () {
      test(
          'should return pokemon when '
          'fire store returns a response', () async {
        final responseMap = <String, dynamic>{
          'pokemon': [
            {
              'index': 1,
              'name': 'bulbasaur',
              'base_experience': 64,
              'weight': 69,
              'height': 7,
              'image_url': '',
              'abilities': ['overgrow'],
              'moves': ['razor-wind'],
              'types': ['grass'],
              'stats': [
                {
                  'base_stat': 65,
                  'effort': 0,
                  'name': 'special-defense',
                  'url': 'https://pokeapi.co/api/v2/stat/5/',
                },
                {
                  'base_stat': 65,
                  'effort': 0,
                  'name': 'special-defense',
                  'url': 'https://pokeapi.co/api/v2/stat/5/',
                },
              ]
            },
          ]
        };
        when(() => mockedFirebaseFirestore.collection(any()))
            .thenReturn(mockCollectionReference);
        when(() => mockCollectionReference.doc(any()))
            .thenReturn(mockDocumentReference);
        when(() => mockDocumentReference.get())
            .thenAnswer((_) async => mockDocumentSnapshot);
        when(() => mockDocumentSnapshot.data()).thenReturn(responseMap);

        final result = await fireStoreClient.fetchPokedex('');

        expect(result, isA<RemotePokedex>());
      });
      test('should throw error when fire store returns the exception',
          () async {
        when(() => mockedFirebaseFirestore.collection(any()))
            .thenReturn(mockCollectionReference);
        when(() => mockCollectionReference.doc(any()))
            .thenReturn(mockDocumentReference);
        when(() => mockDocumentReference.get())
            .thenAnswer((_) async => mockDocumentSnapshot);
        when(() => mockDocumentSnapshot.data()).thenReturn(null);

        expect(
          fireStoreClient.fetchPokedex(''),
          throwsA(isA<FireStoreFailureException>()),
        );
      });
    });
  });
}
