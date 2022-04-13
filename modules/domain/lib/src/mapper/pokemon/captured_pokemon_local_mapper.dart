import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:local/local.dart';

class CapturedPokemonLocalMapper
    extends ModelEntityMapper<CapturedPokemon, LocalPokemon> {
  @override
  CapturedPokemon mapFromEntityToModel(LocalPokemon entity) {
    return CapturedPokemon(
      index: entity.index,
      avatar: entity.imageUrl,
      name: entity.name,
      isCaptured: entity.isCaptured,
    );
  }

  @override
  LocalPokemon mapFromModelToEntity(CapturedPokemon model) {
    throw UnimplementedError();
  }
}
