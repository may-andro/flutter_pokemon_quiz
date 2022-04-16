import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:local/local.dart';
import 'package:domain/src/model/model.dart';

class RemoveFavoritePokemonUseCase {
  RemoveFavoritePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, Pokemon> call(Pokemon pokemon) {
    final localPokemon = LocalPokemon(
      id: pokemon.index,
      imageUrl: pokemon.imageUrl,
      name: pokemon.name,
      isCaptured: pokemon.isCaptured,
    );
    try {
      _pokemonRepository.putPokemon(localPokemon);
      return Right(pokemon.copyWith(isFavorite: false));
    } catch (e) {
      return const Left(Failure(ERROR_DB_ID));
    }
  }
}
