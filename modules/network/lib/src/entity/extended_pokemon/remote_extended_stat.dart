import 'package:json_annotation/json_annotation.dart';

part 'remote_extended_stat.g.dart';

@JsonSerializable()
class RemoteExtendedStat {
  RemoteExtendedStat(
    this.name,
    this.url,
  );

  factory RemoteExtendedStat.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedStatFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedStatToJson(this);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;
}
