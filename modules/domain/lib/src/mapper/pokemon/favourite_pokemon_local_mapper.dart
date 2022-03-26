import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:local/local.dart';

class FavouritePokemonLocalMapper
    extends ModelEntityMapper<FavouritePokemon, LocalPokemon> {
  @override
  FavouritePokemon mapFromEntityToModel(LocalPokemon entity) {
    return FavouritePokemon(
      index: entity.index,
      avatar: entity.imageUrl,
      name: entity.name,
    );
  }

  @override
  LocalPokemon mapFromModelToEntity(FavouritePokemon model) {
    throw UnimplementedError();
  }
}
