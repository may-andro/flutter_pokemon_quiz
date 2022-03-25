import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/mapper/mapper.dart';
import 'package:domain/model/model.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchFavouritePokemonsUseCase {
  FetchFavouritePokemonsUseCase(
    this._pokemonRepository,
    this._favouritePokemonLocalMapper,
  );

  final PokemonRepository _pokemonRepository;
  final FavouritePokemonLocalMapper _favouritePokemonLocalMapper;

  Either<Failure, List<FavouritePokemon>> call() {
    try {
      final localPokemons = _pokemonRepository.getAllFavorites();
      final pokemons = localPokemons
          .map(_favouritePokemonLocalMapper.mapFromEntityToModel)
          .toList();
      return Right(pokemons);
    } catch (e) {
      return Left(Failure(ERROR_SERVER_ID));
    }
  }
}
