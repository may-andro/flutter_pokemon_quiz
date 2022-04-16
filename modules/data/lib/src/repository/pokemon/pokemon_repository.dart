import 'package:local/local.dart';
import 'package:network/network.dart';

abstract class PokemonRepository {
  int putPokemon(LocalPokemon localPokemon);

  bool removePokemon(int id);

  List<LocalPokemon> getPokemons();

  LocalPokemon? getPokemon(int index);

  Future<RemoteExtendedPokemon> fetchPokemon(int index);

  List<LocalPokemon> queryFavoritePokemons();

  List<LocalPokemon> queryCapturedPokemons();

  bool queryIsCapturedPokemon(int index);

  bool queryIsFavoritePokemon(int index);
}
