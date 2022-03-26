import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/repository/pokedex/pokedex_repository.dart';
import 'package:network/network.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  PokedexRepositoryImpl(this._pokedexDataSource);

  final PokedexDataSource _pokedexDataSource;

  @override
  Future<RemotePokedex> fetchPokedex(String region) async {
    return _pokedexDataSource.fetchPokedex(region);
  }
}
