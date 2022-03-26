import 'package:data/src/data_source/pokemon/pokemon_data_source.dart';
import 'package:local/local.dart';

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
