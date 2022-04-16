import 'package:local/local.dart';
import 'package:network/network.dart';

abstract class PokemonRepository {
  void putPokemon(LocalPokemon localPokemon);

  void removePokemon(int id);

  List<LocalPokemon> getPokemons();

  Future<RemoteExtendedPokemon> fetchPokemon(int index);

  List<LocalPokemon> queryFavoritePokemons();

  List<LocalPokemon> queryCapturedPokemons();

  bool queryIsCapturedPokemon(int index);

  bool queryIsFavoritePokemon(int index);
}
