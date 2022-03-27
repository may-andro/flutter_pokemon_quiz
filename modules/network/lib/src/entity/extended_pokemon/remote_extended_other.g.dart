// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extended_other.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtendedOther _$RemoteExtendedOtherFromJson(Map<String, dynamic> json) =>
    RemoteExtendedOther(
      dreamWorld: json['dream_world'] == null
          ? null
          : RemoteExtendedDreamWorld.fromJson(
              json['dream_world'] as Map<String, dynamic>),
      home: json['home'] == null
          ? null
          : RemoteExtendedHome.fromJson(json['home'] as Map<String, dynamic>),
      officialArtwork: json['official-artwork'] == null
          ? null
          : RemoteExtendedOfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteExtendedOtherToJson(
        RemoteExtendedOther instance) =>
    <String, dynamic>{
      'dream_world': instance.dreamWorld,
      'home': instance.home,
      'official-artwork': instance.officialArtwork,
    };
