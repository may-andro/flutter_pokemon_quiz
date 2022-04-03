import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class FetchFavouritePokemonsUseCase {
  FetchFavouritePokemonsUseCase(
    this._pokemonRepository,
    this._favouritePokemonLocalMapper,
  );

  final PokemonRepository _pokemonRepository;
  final FavouritePokemonLocalMapper _favouritePokemonLocalMapper;

  Either<Failure, List<FavouritePokemon>> call() {
    try {
      final localPokemons = _pokemonRepository.getAllFavoritePokemons();
      final pokemons = localPokemons
          .map(_favouritePokemonLocalMapper.mapFromEntityToModel)
          .toList();
      return Right(pokemons);
    } catch (e) {
      return const Left(Failure(ERROR_SERVER_ID));
    }
  }
}
