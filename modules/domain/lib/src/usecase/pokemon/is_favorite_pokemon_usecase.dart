import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class IsFavouritePokemonUseCase {
  IsFavouritePokemonUseCase(
    this._pokemonRepository,
    this._favouritePokemonLocalMapper,
  );

  final PokemonRepository _pokemonRepository;
  final CapturedPokemonLocalMapper _favouritePokemonLocalMapper;

  Either<Failure, CapturedPokemon> call(int pokemonIndex) {
    try {
      final localPokemon = _pokemonRepository.queryIsFavoritePokemon(
        pokemonIndex,
      );
      final pokemon = _favouritePokemonLocalMapper.mapFromEntityToModel(
        localPokemon,
      );
      return Right(pokemon);
    } catch (e) {
      return const Left(Failure(ERROR_SERVER_ID));
    }
  }
}
