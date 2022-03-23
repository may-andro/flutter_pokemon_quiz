import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:network/entity/pokedex/remote_pokedex.dart';

@singleton
class FirebaseClient {
  FirebaseClient(this._firestore);

  final FirebaseFirestore _firestore;

  Future<RemotePokedex> fetchPokedex(String documentId) async {
    final snapshot =
        await _firestore.collection('pokedex').doc(documentId).get();
    final dynamic pokedexJson = snapshot.data();
    if (pokedexJson == null) {
      throw Exception();
    }
    return RemotePokedex.fromJson(pokedexJson);
  }
}
