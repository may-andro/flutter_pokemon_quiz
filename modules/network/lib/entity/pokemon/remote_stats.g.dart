// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStats _$RemoteStatsFromJson(Map<String, dynamic> json) => RemoteStats(
      json['base_stat'] as int,
      json['effort'] as int,
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$RemoteStatsToJson(RemoteStats instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'name': instance.name,
      'url': instance.url,
    };
