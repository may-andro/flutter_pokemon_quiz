import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_favorite_pokemon_usecase.freezed.dart';

@freezed
class RemoveFavoritePokemonUseCaseFailure extends Failure
    with _$RemoveFavoritePokemonUseCaseFailure {
  const factory RemoveFavoritePokemonUseCaseFailure.server({
    Exception? error,
    StackTrace? stackTrace,
  }) = RemoveFavoritePokemonLocalFailure;

  const factory RemoveFavoritePokemonUseCaseFailure.parse({
    Exception? error,
    StackTrace? stackTrace,
  }) = RemoveFavoritePokemonParseFailure;
}

class RemoveFavoritePokemonUseCase {
  RemoveFavoritePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, Pokemon> call(Pokemon pokemon) {
    try {
      _pokemonRepository.removeFromFavorites(pokemon);
      return Right(pokemon.copyWith(isFavorite: false));
    } catch (e) {
      return const Left(RemoveFavoritePokemonUseCaseFailure.server());
    }
  }
}
