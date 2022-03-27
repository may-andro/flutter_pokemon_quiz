// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extended_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtendedPokemon _$RemoteExtendedPokemonFromJson(
        Map<String, dynamic> json) =>
    RemoteExtendedPokemon(
      json['id'] as int,
      json['name'] as String,
      json['base_experience'] as int,
      json['height'] as int,
      json['weight'] as int,
      (json['abilities'] as List<dynamic>)
          .map((e) =>
              RemoteExtendedAbilities.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['moves'] as List<dynamic>)
          .map((e) => RemoteExtendedMoves.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['sprites'] == null
          ? null
          : RemoteExtendedSprites.fromJson(
              json['sprites'] as Map<String, dynamic>),
      (json['stats'] as List<dynamic>)
          .map((e) => RemoteExtendedStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['types'] as List<dynamic>)
          .map((e) => RemoteExtendedTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteExtendedPokemonToJson(
        RemoteExtendedPokemon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'moves': instance.moves,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
    };
