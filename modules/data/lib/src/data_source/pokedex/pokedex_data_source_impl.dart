import 'package:data/src/data_source/pokedex/pokedex_data_source.dart';
import 'package:network/network.dart';

class PokedexDataSourceImpl implements PokedexDataSource {
  PokedexDataSourceImpl(this._firebaseClient);

  final FireStoreClient _firebaseClient;

  @override
  Future<RemotePokedex> fetchPokedex(String flavor) {
    return _firebaseClient.fetchPokedex(flavor);
  }
}
