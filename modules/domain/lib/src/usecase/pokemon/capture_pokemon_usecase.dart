import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:local/local.dart';
import 'package:domain/src/model/model.dart';

class CapturePokemonUseCase {
  CapturePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, Pokemon> call(Pokemon params) {
    final localPokemon = LocalPokemon(
      id: params.index,
      imageUrl: params.imageUrl,
      name: params.name,
      isCaptured: true,
      isFavorite: params.isFavorite,
    );
    try {
      _pokemonRepository.putPokemon(localPokemon);
      final updatedPokemon = params.copyWith(isCaptured: true);
      return Right(updatedPokemon);
    } catch (e) {
      return const Left(Failure(ERROR_DB_ID));
    }
  }
}
