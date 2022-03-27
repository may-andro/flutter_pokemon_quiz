import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_type.dart';

part 'remote_extended_types.g.dart';

@JsonSerializable()
class RemoteExtendedTypes {
  RemoteExtendedTypes(this.type);

  factory RemoteExtendedTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedTypesToJson(this);

  @JsonKey(name: 'type')
  final RemoteExtendedType type;
}
