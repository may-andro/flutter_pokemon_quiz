import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_favorite_pokemon_usecase.freezed.dart';

@freezed
class AddFavoritePokemonUseCaseFailure extends Failure
    with _$AddFavoritePokemonUseCaseFailure {
  const factory AddFavoritePokemonUseCaseFailure.server({
    Exception? error,
    StackTrace? stackTrace,
  }) = AddFavoritePokemonLocalFailure;

  const factory AddFavoritePokemonUseCaseFailure.parse({
    Exception? error,
    StackTrace? stackTrace,
  }) = AddFavoritePokemonParseFailure;
}

class AddFavoritePokemonUseCase {
  AddFavoritePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, Pokemon> call(Pokemon pokemon) {
    try {
      _pokemonRepository.addToFavorites(pokemon);
      return Right(pokemon.copyWith(isFavorite: true));
    } catch (e) {
      return const Left(AddFavoritePokemonUseCaseFailure.server());
    }
  }
}
