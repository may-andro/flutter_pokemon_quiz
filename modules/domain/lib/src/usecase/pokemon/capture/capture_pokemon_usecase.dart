import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capture_pokemon_usecase.freezed.dart';

@freezed
class CapturePokemonUseCaseFailure extends Failure
    with _$CapturePokemonUseCaseFailure {
  const factory CapturePokemonUseCaseFailure.server({
    Exception? error,
    StackTrace? stackTrace,
  }) = CapturePokemonServerFailure;

  const factory CapturePokemonUseCaseFailure.parse({
    Exception? error,
    StackTrace? stackTrace,
  }) = CapturePokemonParseFailure;
}

class CapturePokemonUseCase {
  CapturePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, Pokemon> call(Pokemon pokemon) {
    try {
      _pokemonRepository.addToCaptured(pokemon);
      return Right(pokemon.copyWith(isCaptured: true));
    } catch (e) {
      return const Left(CapturePokemonUseCaseFailure.server());
    }
  }
}
