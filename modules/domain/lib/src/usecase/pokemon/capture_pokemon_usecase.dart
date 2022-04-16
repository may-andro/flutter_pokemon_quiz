import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:local/local.dart';
import 'package:domain/src/model/model.dart';

class CapturePokemonUseCase {
  CapturePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Either<Failure, void> call(Pokemon params) {
    final localPokemon = LocalPokemon(
      index: params.index,
      imageUrl: params.imageUrl,
      name: params.name,
      isCaptured: true,
    );
    try {
      return Right(_pokemonRepository.putPokemon(localPokemon));
    } catch (e) {
      return const Left(Failure(ERROR_DB_ID));
    }
  }
}
