import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class FetchPokemonUseCase {
  FetchPokemonUseCase(
    this._pokemonRepository,
    this._extendedPokemonRemoteMapper,
  );

  final PokemonRepository _pokemonRepository;
  final ExtendedPokemonRemoteMapper _extendedPokemonRemoteMapper;

  Future<Either<Failure, Pokemon>> call(int index) async {
    try {
      final remotePokemon = await _pokemonRepository.fetchPokemon(index);
      final pokemon = _extendedPokemonRemoteMapper.mapFromEntityToModel(
        remotePokemon,
      );
      return Right(pokemon);
    } catch (e) {
      return const Left(Failure(ERROR_SERVER_ID));
    }
  }
}
