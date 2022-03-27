import 'package:json_annotation/json_annotation.dart';

part 'remote_extended_type.g.dart';

@JsonSerializable()
class RemoteExtendedType {
  RemoteExtendedType(
    this.name,
    this.url,
  );

  factory RemoteExtendedType.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedTypeToJson(this);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;
}
