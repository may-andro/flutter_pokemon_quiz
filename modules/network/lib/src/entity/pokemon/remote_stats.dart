import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'remote_stats.g.dart';

@JsonSerializable()
class RemoteStats extends Equatable {
  const RemoteStats(
    this.baseStat,
    this.effort,
    this.name,
    this.url,
  );

  factory RemoteStats.fromJson(Map<String, dynamic> json) =>
      _$RemoteStatsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatsToJson(this);

  @JsonKey(name: 'base_stat')
  final int baseStat;

  @JsonKey(name: 'effort')
  final int effort;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  @override
  List<Object?> get props => [baseStat, effort, name, url];
}
