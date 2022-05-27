import 'package:network/network.dart';
import 'package:domain/domain.dart';
import 'package:data/src/mapper/model_entity_mapper.dart';
import 'package:data/src/mapper/pokemon/pokemon_stats_remote_mapper.dart';

class PokemonRemoteMapper implements ModelEntityMapper<Pokemon, RemotePokemon> {
  PokemonRemoteMapper(
    this._pokemonStatsRemoteMapper,
  );

  final PokemonStatsRemoteMapper _pokemonStatsRemoteMapper;

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
      isCaptured: false,
      isFavorite: false,
    );
  }

  @override
  RemotePokemon mapFromModelToEntity(Pokemon model) {
    throw UnimplementedError();
  }
}
