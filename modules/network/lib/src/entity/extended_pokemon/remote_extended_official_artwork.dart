import 'package:json_annotation/json_annotation.dart';

part 'remote_extended_official_artwork.g.dart';

@JsonSerializable()
class RemoteExtendedOfficialArtwork {
  RemoteExtendedOfficialArtwork({this.frontDefault});

  factory RemoteExtendedOfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtendedOfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtendedOfficialArtworkToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;
}
