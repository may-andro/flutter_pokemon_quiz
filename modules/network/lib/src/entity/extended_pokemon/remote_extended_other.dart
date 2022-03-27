import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_dreamworld.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_home.dart';
import 'package:network/src/entity/extended_pokemon/remote_extended_official_artwork.dart';

part 'remote_extended_other.g.dart';

@JsonSerializable()
class RemoteExtendedOther {
  RemoteExtendedOther({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  factory RemoteExtendedOther.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedOtherFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedOtherToJson(this);

  @JsonKey(name: 'dream_world')
  final RemoteExtendedDreamWorld? dreamWorld;

  @JsonKey(name: 'home')
  final RemoteExtendedHome? home;

  @JsonKey(name: 'official-artwork')
  final RemoteExtendedOfficialArtwork? officialArtwork;
}
