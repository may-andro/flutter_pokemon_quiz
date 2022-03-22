import 'package:pokedex_builder/domain/model/response.dart';

import '../../domain/model/pokemon.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../data_source/pokemon_data_source.dart';
import '../mapper/pokemon_model_entity_mapper.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(
    this._remoteDataSource,
    this._pokemonModelEntityMapper,
  );

  final PokemonDataSource _remoteDataSource;
  final PokemonModelEntityMapper _pokemonModelEntityMapper;

  @override
  Future<Response<Pokemon>> getPokemon({required int index}) async {
    try {
      final pokemonEntity = await _remoteDataSource.fetchPokemon(index: index);
      final pokemon = _pokemonModelEntityMapper.mapFromEntityToModel(
        pokemonEntity,
      );
      return Success(data: pokemon);
    } catch (e) {
      return Failure(error: e);
    }
  }
}
