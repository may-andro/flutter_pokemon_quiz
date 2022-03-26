// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePokemon _$RemotePokemonFromJson(Map<String, dynamic> json) =>
    RemotePokemon(
      index: json['index'] as int,
      name: json['name'] as String,
      baseExperience: json['base_experience'] as int,
      weight: json['weight'] as int,
      height: json['height'] as int,
      imageUrl: json['image_url'] as String,
      abilities:
          (json['abilities'] as List<dynamic>).map((e) => e as String).toList(),
      moves: (json['moves'] as List<dynamic>).map((e) => e as String).toList(),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => RemoteStats.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemotePokemonToJson(RemotePokemon instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'weight': instance.weight,
      'height': instance.height,
      'image_url': instance.imageUrl,
      'abilities': instance.abilities,
      'moves': instance.moves,
      'types': instance.types,
      'stats': instance.stats.map((e) => e.toJson()).toList(),
    };
