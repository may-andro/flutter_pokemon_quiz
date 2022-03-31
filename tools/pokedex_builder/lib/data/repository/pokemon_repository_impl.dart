import 'package:pokedex_builder/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/data/mapper/pokemon_model_entity_mapper.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/domain/model/response.dart';
import 'package:pokedex_builder/domain/repository/pokemon_repository.dart';

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
