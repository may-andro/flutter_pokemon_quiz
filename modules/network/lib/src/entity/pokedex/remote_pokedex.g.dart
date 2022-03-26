// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_pokedex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePokedex _$RemotePokedexFromJson(Map<String, dynamic> json) =>
    RemotePokedex(
      (json['pokemon'] as List<dynamic>)
          .map((e) => RemotePokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemotePokedexToJson(RemotePokedex instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemons,
    };
