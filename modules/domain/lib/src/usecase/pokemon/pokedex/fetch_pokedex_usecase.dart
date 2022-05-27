import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_pokedex_usecase.freezed.dart';

@freezed
class FetchPokedexUseCaseFailure extends Failure
    with _$FetchPokedexUseCaseFailure {
  const factory FetchPokedexUseCaseFailure.server({
    Exception? error,
    StackTrace? stackTrace,
  }) = FetchPokedexServerFailure;

  const factory FetchPokedexUseCaseFailure.parse({
    Exception? error,
    StackTrace? stackTrace,
  }) = FetchPokedexParseFailure;
}

class FetchPokedexUseCase {
  FetchPokedexUseCase(
    this._pokemonRepository,
    this._buildConfig,
  );

  final PokemonRepository _pokemonRepository;
  final BuildConfig _buildConfig;

  Future<Either<Failure, List<Pokemon>>> call(String region) async {
    try {
      final pokedex = await _pokemonRepository.fetchPokedex(
        _buildConfig.buildFlavor.name,
      );
      return Right(pokedex);
    } catch (e) {
      return Left(const FetchPokedexUseCaseFailure.server());
    }
  }
}
