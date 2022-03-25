import 'package:data/data_source/pokedex/pokedex_data_source.dart';
import 'package:data/repository/pokedex/pokedex_repository.dart';
import 'package:network/network.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PokedexRepository)
class PokedexRepositoryImpl implements PokedexRepository {
  PokedexRepositoryImpl(this._pokedexDataSource);

  final PokedexDataSource _pokedexDataSource;

  @override
  Future<RemotePokedex> fetchPokedex(String region) async {
    return _pokedexDataSource.fetchPokedex(region);
  }
}
