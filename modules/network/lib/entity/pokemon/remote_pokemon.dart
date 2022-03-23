import 'package:json_annotation/json_annotation.dart';
import 'package:network/entity/pokemon/remote_stats.dart';

part 'remote_pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
class RemotePokemon {
  RemotePokemon({
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

  factory RemotePokemon.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePokemonToJson(this);

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
  final List<RemoteStats> stats;
}
