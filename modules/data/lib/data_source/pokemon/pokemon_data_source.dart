import 'package:local/entity/entities.dart';

abstract class PokemonDataSource{
  void putFavoritePokemon(LocalPokemon localPokemon);

  void removeFavoritePokemon(int id);

  List<LocalPokemon?> getAllFavorites();
}