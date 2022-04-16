import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:local/local.dart';
import 'package:domain/src/model/model.dart';

class AddFavoritePokemonUseCase {
  AddFavoritePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, Pokemon> call(Pokemon params) {
    final localPokemon = LocalPokemon(
      id: params.index,
      imageUrl: params.imageUrl,
      name: params.name,
      isFavorite: true,
      isCaptured: params.isCaptured,
    );
    try {
      _pokemonRepository.putPokemon(localPokemon);
      return Right(params.copyWith(isFavorite: true));
    } catch (e) {
      return const Left(Failure(ERROR_DB_ID));
    }
  }
}
