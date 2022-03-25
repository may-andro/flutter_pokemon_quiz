import 'package:domain/mapper/model_entity_mapper.dart';
import 'package:domain/model/pokemon/favourite_pokemon.dart';
import 'package:local/local.dart';
import 'package:injectable/injectable.dart';

@injectable
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
