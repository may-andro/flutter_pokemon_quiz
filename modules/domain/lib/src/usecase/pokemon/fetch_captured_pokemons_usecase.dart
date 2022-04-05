import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class FetchCapturedPokemonsUseCase {
  FetchCapturedPokemonsUseCase(
    this._pokemonRepository,
    this._favouritePokemonLocalMapper,
  );

  final PokemonRepository _pokemonRepository;
  final CapturedPokemonLocalMapper _favouritePokemonLocalMapper;

  Either<Failure, List<CapturedPokemon>> call() {
    try {
      final localPokemons = _pokemonRepository.queryCapturedPokemons();
      final pokemons = localPokemons
          .map(_favouritePokemonLocalMapper.mapFromEntityToModel)
          .toList();
      return Right(pokemons);
    } catch (e) {
      return const Left(Failure(ERROR_SERVER_ID));
    }
  }
}
