import 'package:domain/mapper/model_entity_mapper.dart';
import 'package:domain/mapper/pokemon/pokemon_stats_remote_mapper.dart';
import 'package:domain/model/pokemon/pokemon.dart';
import 'package:network/network.dart';
import 'package:injectable/injectable.dart';

@injectable
class PokemonRemoteMapper implements ModelEntityMapper<Pokemon, RemotePokemon> {
  PokemonRemoteMapper(this._pokemonStatsRemoteMapper);

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
    );
  }

  @override
  RemotePokemon mapFromModelToEntity(Pokemon model) {
    throw UnimplementedError();
  }
}
