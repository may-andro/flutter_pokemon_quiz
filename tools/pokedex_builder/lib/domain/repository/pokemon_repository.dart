import 'package:dartz/dartz.dart';
import 'package:pokedex_builder/domain/model/failure.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemon({required int index});
}
