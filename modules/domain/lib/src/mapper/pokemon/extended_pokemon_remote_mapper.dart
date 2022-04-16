import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/pokemon/is_captured_pokemon_usecase.dart';
import 'package:domain/src/usecase/pokemon/is_favorite_pokemon_usecase.dart';
import 'package:network/network.dart';

class ExtendedPokemonRemoteMapper
    implements ModelEntityMapper<Pokemon, RemoteExtendedPokemon> {
  ExtendedPokemonRemoteMapper(
    this._isFavoritePokemonUseCase,
    this._isCapturedPokemonUseCase,
  );

  final IsFavoritePokemonUseCase _isFavoritePokemonUseCase;
  final IsCapturedPokemonUseCase _isCapturedPokemonUseCase;

  @override
  Pokemon mapFromEntityToModel(RemoteExtendedPokemon entity) {
    final imageUrl = entity.sprites?.other?.officialArtwork?.frontDefault ??
        entity.sprites?.other?.dreamWorld?.frontDefault ??
        entity.sprites?.frontDefault ??
        '';
    final moves = entity.moves.map((move) => move.move.name).toList();
    final types = entity.types.map((type) => type.type.name).toList();
    final abilities =
        entity.abilities.map((ability) => ability.ability.name).toList();
    final stats = entity.stats
        .map((stat) => PokemonStat(
            baseStat: stat.baseStat, effort: stat.effort, name: stat.stat.name))
        .toList();

    return Pokemon(
      index: entity.id,
      baseExperience: entity.baseExperience,
      height: entity.height,
      weight: entity.weight,
      imageUrl: imageUrl,
      name: entity.name,
      abilities: abilities,
      moves: moves,
      types: types,
      stats: stats,
      isFavorite: _isFavoritePokemonUseCase(entity.id),
      isCaptured: _isCapturedPokemonUseCase(entity.id),
    );
  }

  @override
  RemoteExtendedPokemon mapFromModelToEntity(Pokemon model) {
    throw UnimplementedError();
  }
}
