import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:local/local.dart';

class PokemonLocalMapper implements ModelEntityMapper<Pokemon, LocalPokemon> {
  @override
  Pokemon mapFromEntityToModel(LocalPokemon entity) {
    throw UnimplementedError();
  }

  @override
  LocalPokemon mapFromModelToEntity(Pokemon model) {
    return LocalPokemon(
      index: model.index,
      imageUrl: model.imageUrl,
      name: model.name,
    );
  }
}
