import 'package:domain/mapper/model_entity_mapper.dart';
import 'package:domain/model/pokemon/pokemon_stat.dart';
import 'package:network/network.dart';
import 'package:injectable/injectable.dart';

@injectable
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
