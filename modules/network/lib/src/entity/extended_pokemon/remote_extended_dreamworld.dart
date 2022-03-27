import 'package:json_annotation/json_annotation.dart';

part 'remote_extended_dreamworld.g.dart';

@JsonSerializable()
class RemoteExtendedDreamWorld {
  RemoteExtendedDreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  factory RemoteExtendedDreamWorld.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedDreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedDreamWorldToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;
}
