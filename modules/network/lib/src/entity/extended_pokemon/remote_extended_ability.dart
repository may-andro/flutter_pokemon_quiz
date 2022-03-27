import 'package:json_annotation/json_annotation.dart';

part 'remote_extended_ability.g.dart';

@JsonSerializable()
class RemoteExtendedAbility {
  RemoteExtendedAbility(
    this.name,
    this.url,
  );

  factory RemoteExtendedAbility.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedAbilityToJson(this);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;
}
