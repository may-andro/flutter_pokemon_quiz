import 'package:network/network.dart';
import 'package:domain/domain.dart';
import 'package:data/src/mapper/model_entity_mapper.dart';

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
