import 'package:pokedex_builder/data/entity/remote_pokemon.dart';
import 'package:pokedex_builder/data/mapper/model_entity_mapper.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/domain/model/stats.dart';
import 'package:pokedex_builder/exceptions/exceptions.dart';

class PokemonModelEntityMapper
    extends ModelEntityMapper<Pokemon, RemotePokemon> {
  @override
  Pokemon mapFromEntityToModel(RemotePokemon entity) {
    try {
      final imageUrl = entity.sprites?.other?.officialArtwork?.frontDefault ??
          entity.sprites?.other?.dreamWorld?.frontDefault ??
          entity.sprites?.frontDefault ??
          '';
      final moves = entity.moves.map((move) => move.move.name).toList();
      final types = entity.types.map((type) => type.type.name).toList();
      final abilities =
          entity.abilities.map((ability) => ability.ability.name).toList();
      final stats = entity.stats
          .map((stat) =>
              Stats(stat.baseStat, stat.effort, stat.stat.name, stat.stat.url))
          .toList();

      return Pokemon(
        index: entity.id,
        name: entity.name,
        baseExperience: entity.baseExperience,
        weight: entity.weight,
        height: entity.height,
        imageUrl: imageUrl,
        abilities: abilities,
        moves: moves,
        types: types,
        stats: stats,
      );
    } catch (e) {
      throw ParsingException('Parsing failed $PokemonModelEntityMapper');
    }
  }

  @override
  RemotePokemon mapFromModelToEntity(Pokemon model) {
    throw ParsingException(
      'Parsing failed $PokemonModelEntityMapper as Unimplemented',
    );
  }
}
