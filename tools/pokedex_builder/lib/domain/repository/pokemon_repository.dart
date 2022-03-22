import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/domain/model/response.dart';

abstract class PokemonRepository {
  Future<Response<Pokemon>> getPokemon({required int index});
}
