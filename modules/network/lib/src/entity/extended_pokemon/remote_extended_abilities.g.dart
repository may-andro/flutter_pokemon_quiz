// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extended_abilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtendedAbilities _$RemoteExtendedAbilitiesFromJson(
        Map<String, dynamic> json) =>
    RemoteExtendedAbilities(
      RemoteExtendedAbility.fromJson(json['ability'] as Map<String, dynamic>),
      json['is_hidden'] as bool,
      json['slot'] as int,
    );

Map<String, dynamic> _$RemoteExtendedAbilitiesToJson(
        RemoteExtendedAbilities instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };
