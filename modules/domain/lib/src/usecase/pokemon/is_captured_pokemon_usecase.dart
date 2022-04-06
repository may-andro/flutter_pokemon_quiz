import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/model/model.dart';

class IsCapturedPokemonUseCase {
  IsCapturedPokemonUseCase(
    this._pokemonRepository,
  );

  final PokemonRepository _pokemonRepository;

  Either<Failure, bool> call(int pokemonIndex) {
    try {
      final localPokemon = _pokemonRepository.queryIsCapturedPokemon(
        pokemonIndex,
      );
      return Right(localPokemon.isCaptured);
    } catch (e) {
      return const Left(Failure(ERROR_SERVER_ID));
    }
  }
}
