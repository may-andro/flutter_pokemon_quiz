import 'package:domain/src/model/model.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokedex(String region);

  Future<Pokemon> fetchPokemon(int index);

  int addToFavorites(Pokemon pokemon);

  bool isFavoritePokemon(int index);

  int removeFromFavorites(Pokemon pokemon);

  int addToCaptured(Pokemon pokemon);

  bool isCapturedPokemon(int index);
}
