import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/mapper/pokemon/pokemon_stats_remote_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/pokemon/is_captured_pokemon_usecase.dart';
import 'package:domain/src/usecase/pokemon/is_favorite_pokemon_usecase.dart';
import 'package:network/network.dart';

class PokemonRemoteMapper implements ModelEntityMapper<Pokemon, RemotePokemon> {
  PokemonRemoteMapper(
    this._pokemonStatsRemoteMapper,
    this._isFavoritePokemonUseCase,
    this._isCapturedPokemonUseCase,
  );

  final PokemonStatsRemoteMapper _pokemonStatsRemoteMapper;
  final IsFavoritePokemonUseCase _isFavoritePokemonUseCase;
  final IsCapturedPokemonUseCase _isCapturedPokemonUseCase;

  @override
  Pokemon mapFromEntityToModel(RemotePokemon entity) {
    final stats = entity.stats
        .map(_pokemonStatsRemoteMapper.mapFromEntityToModel)
        .toList();

    return Pokemon(
      index: entity.index,
      baseExperience: entity.baseExperience,
      height: entity.height,
      weight: entity.weight,
      imageUrl: entity.imageUrl,
      name: entity.name,
      abilities: entity.abilities,
      moves: entity.moves,
      types: entity.types,
      stats: stats,
      isCaptured: _isCapturedPokemonUseCase(entity.index),
      isFavorite: _isFavoritePokemonUseCase(entity.index),
    );
  }

  @override
  RemotePokemon mapFromModelToEntity(Pokemon model) {
    throw UnimplementedError();
  }
}
