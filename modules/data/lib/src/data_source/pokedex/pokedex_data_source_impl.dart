import 'package:data/src/data_source/pokedex/pokedex_data_source.dart';
import 'package:network/network.dart';

class PokedexDataSourceImpl implements PokedexDataSource {
  PokedexDataSourceImpl(this._fireStoreClient);

  final FireStoreClient _fireStoreClient;

  @override
  Future<RemotePokedex> fetchPokedex(String flavor) {
    return _fireStoreClient.fetchPokedex(flavor);
  }
}
