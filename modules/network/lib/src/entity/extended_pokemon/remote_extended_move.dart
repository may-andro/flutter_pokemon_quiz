import 'package:json_annotation/json_annotation.dart';

part 'remote_extended_move.g.dart';

@JsonSerializable()
class RemoteExtendedMove {
  RemoteExtendedMove(
    this.name,
    this.url,
  );

  factory RemoteExtendedMove.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedMoveFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedMoveToJson(this);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;
}
