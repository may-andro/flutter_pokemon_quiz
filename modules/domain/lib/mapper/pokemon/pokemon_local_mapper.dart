import 'package:domain/mapper/model_entity_mapper.dart';
import 'package:domain/model/pokemon/pokemon.dart';
import 'package:local/local.dart';
import 'package:injectable/injectable.dart';

@injectable
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
