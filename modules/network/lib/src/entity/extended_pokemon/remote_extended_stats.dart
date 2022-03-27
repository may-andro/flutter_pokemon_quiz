import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_stat.dart';

part 'remote_extended_stats.g.dart';

@JsonSerializable()
class RemoteExtendedStats {
  RemoteExtendedStats(
    this.baseStat,
    this.effort,
    this.stat,
  );

  factory RemoteExtendedStats.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedStatsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedStatsToJson(this);

  @JsonKey(name: 'base_stat')
  final int baseStat;

  @JsonKey(name: 'effort')
  final int effort;

  @JsonKey(name: 'stat')
  final RemoteExtendedStat stat;
}
