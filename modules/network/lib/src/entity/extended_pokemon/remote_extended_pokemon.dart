import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_abilities.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_moves.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_sprites.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_stats.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_types.dart';

part 'remote_extended_pokemon.g.dart';

@JsonSerializable()
class RemoteExtendedPokemon {
  RemoteExtendedPokemon(
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.weight,
    this.abilities,
    this.moves,
    this.sprites,
    this.stats,
    this.types,
  );

  factory RemoteExtendedPokemon.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedPokemonToJson(this);

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'base_experience')
  int baseExperience;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'weight')
  int weight;

  @JsonKey(name: 'abilities')
  List<RemoteExtendedAbilities> abilities;

  @JsonKey(name: 'moves')
  List<RemoteExtendedMoves> moves;

  @JsonKey(name: 'sprites')
  RemoteExtendedSprites? sprites;

  @JsonKey(name: 'stats')
  List<RemoteExtendedStats> stats;

  @JsonKey(name: 'types')
  List<RemoteExtendedTypes> types;
}
