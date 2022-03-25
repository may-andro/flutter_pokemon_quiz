import 'package:local/local.dart';

abstract class PokemonRepository {
  void putFavoritePokemon(LocalPokemon localPokemon);

  void removeFavoritePokemon(int id);

  List<LocalPokemon> getAllFavorites();
}
