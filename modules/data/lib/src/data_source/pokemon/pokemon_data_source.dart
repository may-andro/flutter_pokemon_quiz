import 'package:local/local.dart';
import 'package:local/objectbox.g.dart';
import 'package:network/network.dart';

abstract class PokemonDataSource {
  int putPokemon(LocalPokemon localPokemon);

  bool removePokemon(int id);

  List<LocalPokemon> getPokemons();

  Future<RemoteExtendedPokemon> fetchPokemon(int index);

  List<LocalPokemon> queryPokemon(Condition<LocalPokemon> condition);
}
