import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_ability.dart';

part 'remote_extended_abilities.g.dart';

@JsonSerializable()
class RemoteExtendedAbilities {
  RemoteExtendedAbilities(
    this.ability,
    this.isHidden,
    this.slot,
  );

  factory RemoteExtendedAbilities.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedAbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedAbilitiesToJson(this);

  @JsonKey(name: 'ability')
  final RemoteExtendedAbility ability;

  @JsonKey(name: 'is_hidden')
  final bool isHidden;

  @JsonKey(name: 'slot')
  final int slot;
}
