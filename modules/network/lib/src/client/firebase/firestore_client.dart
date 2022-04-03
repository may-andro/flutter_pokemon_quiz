import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:network/src/entity/entity.dart';
import 'package:network/src/exception/exceptions.dart';

class FireStoreClient {
  FireStoreClient(this._firestore);

  final FirebaseFirestore _firestore;

  Future<RemotePokedex> fetchPokedex(String documentId) async {
    final snapshot =
        await _firestore.collection('pokedex').doc(documentId).get();
    final dynamic pokedexJson = snapshot.data();
    if (pokedexJson == null) {
      throw FireStoreFailureException(StackTrace.current);
    }
    return RemotePokedex.fromJson(pokedexJson);
  }
}
