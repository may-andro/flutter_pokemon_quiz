import 'package:json_annotation/json_annotation.dart';

part 'remote_extended_home.g.dart';

@JsonSerializable()
class RemoteExtendedHome {
  RemoteExtendedHome({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory RemoteExtendedHome.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedHomeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedHomeToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
}
