import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:network/network.dart';

class PokemonStatsRemoteMapper
    implements ModelEntityMapper<PokemonStat, RemoteStats> {
  @override
  PokemonStat mapFromEntityToModel(RemoteStats entity) {
    return PokemonStat(
      baseStat: entity.baseStat,
      name: entity.name,
      effort: entity.effort,
    );
  }

  @override
  RemoteStats mapFromModelToEntity(PokemonStat model) {
    throw UnimplementedError();
  }
}
