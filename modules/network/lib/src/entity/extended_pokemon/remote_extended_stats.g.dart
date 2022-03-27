// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extended_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtendedStats _$RemoteExtendedStatsFromJson(Map<String, dynamic> json) =>
    RemoteExtendedStats(
      json['base_stat'] as int,
      json['effort'] as int,
      RemoteExtendedStat.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteExtendedStatsToJson(
        RemoteExtendedStats instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };
