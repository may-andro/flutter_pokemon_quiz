import 'package:json_annotation/json_annotation.dart';
import 'remote_dreamworld.dart';
import 'remote_home.dart';
import 'remote_official_artwork.dart';

part 'remote_other.g.dart';

@JsonSerializable()
class RemoteOther {
  RemoteOther({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  @JsonKey(name: 'dream_world')
  final RemoteDreamWorld? dreamWorld;

  @JsonKey(name: 'home')
  final RemoteHome? home;

  @JsonKey(name: 'official-artwork')
  final RemoteOfficialArtwork? officialArtwork;

  factory RemoteOther.fromJson(Map<String, dynamic> json) =>
      _$RemoteOtherFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOtherToJson(this);
}
