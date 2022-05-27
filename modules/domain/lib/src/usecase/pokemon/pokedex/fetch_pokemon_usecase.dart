import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_pokemon_usecase.freezed.dart';

@freezed
class FetchPokemonUseCaseFailure extends Failure
    with _$FetchPokemonUseCaseFailure {
  const factory FetchPokemonUseCaseFailure.server({
    Exception? error,
    StackTrace? stackTrace,
  }) = FetchPokemonServerFailure;

  const factory FetchPokemonUseCaseFailure.parse({
    Exception? error,
    StackTrace? stackTrace,
  }) = FetchPokemonParseFailure;
}

class FetchPokemonUseCase {
  FetchPokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Future<Either<Failure, Pokemon>> call(int index) async {
    try {
      final pokemon = await _pokemonRepository.fetchPokemon(index);
      return Right(pokemon);
    } catch (e) {
      return const Left(FetchPokemonUseCaseFailure.server());
    }
  }
}
