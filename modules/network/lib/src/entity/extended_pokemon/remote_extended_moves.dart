import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_move.dart';

part 'remote_extended_moves.g.dart';

@JsonSerializable()
class RemoteExtendedMoves {
  RemoteExtendedMoves(this.move);

  factory RemoteExtendedMoves.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedMovesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedMovesToJson(this);

  @JsonKey(name: 'move')
  final RemoteExtendedMove move;
}
