import 'package:data/data_source/pokemon/pokemon_data_source.dart';
import 'package:local/client/clients.dart';
import 'package:local/entity/pokemon/local_pokemon.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PokemonDataSource)
class PokemonDataSourceImpl implements PokemonDataSource {
  PokemonDataSourceImpl(this._localClient);

  final PokemonLocalClient _localClient;

  @override
  List<LocalPokemon?> getAllFavorites() {
    return _localClient.getAll();
  }

  @override
  void putFavoritePokemon(LocalPokemon localPokemon) {
    _localClient.put(localPokemon);
  }

  @override
  void removeFavoritePokemon(int id) {
    _localClient.remove(id);
  }
}
