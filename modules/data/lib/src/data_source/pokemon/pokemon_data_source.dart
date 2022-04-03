import 'package:local/local.dart';
import 'package:network/network.dart';

abstract class PokemonDataSource {
  void putFavoritePokemon(LocalPokemon localPokemon);

  void removeFavoritePokemon(int id);

  List<LocalPokemon?> getAllFavoritePokemons();

  Future<RemoteExtendedPokemon> fetchPokemon(int index);
}
