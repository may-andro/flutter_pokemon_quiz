import 'package:data/data_source/pokedex/pokedex_data_source.dart';
import 'package:network/network.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PokedexDataSource)
class PokedexDataSourceImpl implements PokedexDataSource {
  PokedexDataSourceImpl(this._firebaseClient);

  final FirebaseClient _firebaseClient;

  @override
  Future<RemotePokedex> fetchPokedex(String flavor) {
    return _firebaseClient.fetchPokedex(flavor);
  }
}
