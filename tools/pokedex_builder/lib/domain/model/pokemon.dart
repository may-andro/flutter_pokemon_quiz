import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/domain/model/stats.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon({
    required this.index,
    required this.name,
    required this.baseExperience,
    required this.weight,
    required this.height,
    required this.imageUrl,
    required this.abilities,
    required this.moves,
    required this.types,
    required this.stats,
  });

  @JsonKey(name: 'index')
  final int index;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'base_experience')
  final int baseExperience;

  @JsonKey(name: 'weight')
  final int weight;

  @JsonKey(name: 'height')
  final int height;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'abilities')
  final List<String> abilities;

  @JsonKey(name: 'moves')
  final List<String> moves;

  @JsonKey(name: 'types')
  final List<String> types;

  @JsonKey(name: 'stats')
  final List<Stats> stats;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
