import 'package:pokedex_builder/data/entity/remote_pokemon.dart';

abstract class PokemonDataSource {
  Future<RemotePokemon> fetchPokemon({required int index});
}
