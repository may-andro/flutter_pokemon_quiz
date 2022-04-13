import 'package:dartz/dartz.dart';
import 'package:pokedex_builder/domain/model/failure.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/domain/repository/pokemon_repository.dart';

class FetchPokemonUseCase {
  FetchPokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Future<Either<Failure, Pokemon>> call(int param) {
    return _pokemonRepository.getPokemon(index: param);
  }
}
