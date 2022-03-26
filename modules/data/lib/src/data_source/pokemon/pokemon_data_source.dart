import 'package:local/local.dart';

abstract class PokemonDataSource{
  void putFavoritePokemon(LocalPokemon localPokemon);

  void removeFavoritePokemon(int id);

  List<LocalPokemon?> getAllFavorites();
}