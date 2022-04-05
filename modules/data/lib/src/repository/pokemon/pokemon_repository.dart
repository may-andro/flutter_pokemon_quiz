import 'package:local/local.dart';
import 'package:network/network.dart';

abstract class PokemonRepository {
  void putPokemon(LocalPokemon localPokemon);

  void removePokemon(int id);

  List<LocalPokemon> getPokemons();

  Future<RemoteExtendedPokemon> fetchPokemon(int index);

  List<LocalPokemon> queryFavoritePokemons();

  List<LocalPokemon> queryCapturedPokemons();

  LocalPokemon queryIsCapturedPokemon(int index);

  LocalPokemon queryIsFavoritePokemon(int index);
}
