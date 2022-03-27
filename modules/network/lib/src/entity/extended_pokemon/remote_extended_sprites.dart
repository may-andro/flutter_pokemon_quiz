import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_other.dart';

part 'remote_extended_sprites.g.dart';

@JsonSerializable()
class RemoteExtendedSprites {
  RemoteExtendedSprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  factory RemoteExtendedSprites.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedSpritesToJson(this);

  @JsonKey(name: 'back_default')
  final String? backDefault;

  @JsonKey(name: 'back_female')
  final String? backFemale;

  @JsonKey(name: 'back_shiny')
  final String? backShiny;

  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  @JsonKey(name: 'other')
  final RemoteExtendedOther? other;
}
