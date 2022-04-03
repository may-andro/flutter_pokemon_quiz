import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class AddFavouritePokemonUseCase {
  AddFavouritePokemonUseCase(
    this._pokemonRepository,
    this._pokemonLocalMapper,
  );

  final PokemonRepository _pokemonRepository;
  final PokemonLocalMapper _pokemonLocalMapper;

  Either<Failure, void> call(Pokemon params) {
    final localPokemon = _pokemonLocalMapper.mapFromModelToEntity(params);
    try {
      return Right(_pokemonRepository.putFavoritePokemon(localPokemon));
    } catch (e) {
      return const Left(Failure(ERROR_DB_ID));
    }
  }
}
