import 'package:dartz/dartz.dart';
import 'package:pokedex_builder/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/data/mapper/pokemon_model_entity_mapper.dart';
import 'package:pokedex_builder/domain/model/failure.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/domain/repository/pokemon_repository.dart';
import 'package:pokedex_builder/exceptions/exceptions.dart';
import 'package:pokedex_builder/logger/tool_logger.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(
    this._remoteDataSource,
    this._pokemonModelEntityMapper,
    this._toolLogger,
  );

  final PokemonDataSource _remoteDataSource;
  final PokemonModelEntityMapper _pokemonModelEntityMapper;
  final ToolLogger _toolLogger;

  @override
  Future<Either<Failure, Pokemon>> getPokemon({required int index}) async {
    try {
      final pokemonEntity = await _remoteDataSource.fetchPokemon(index: index);
      final pokemon = _pokemonModelEntityMapper.mapFromEntityToModel(
        pokemonEntity,
      );
      _toolLogger.i('Fetched pokemon: #${pokemon.index}${pokemon.name}');
      return Right(pokemon);
    } catch (e, st) {
      if (e is Exception) {
        return Left(Failure(e, st));
      }
      return Left(Failure(UnknownException(), st));
    }
  }
}
