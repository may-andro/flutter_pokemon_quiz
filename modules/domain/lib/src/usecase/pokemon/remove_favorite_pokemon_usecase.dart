import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/model/model.dart';

class RemoveFavoritePokemonUseCase {
  RemoveFavoritePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, void> call(int params) {
    try {
      return Right(_pokemonRepository.removePokemon(params));
    } catch (e) {
      return const Left(Failure(ERROR_DB_ID));
    }
  }
}
