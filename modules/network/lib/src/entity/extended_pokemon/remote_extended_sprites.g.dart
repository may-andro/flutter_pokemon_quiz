// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extended_sprites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtendedSprites _$RemoteExtendedSpritesFromJson(
        Map<String, dynamic> json) =>
    RemoteExtendedSprites(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
      other: json['other'] == null
          ? null
          : RemoteExtendedOther.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteExtendedSpritesToJson(
        RemoteExtendedSprites instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'other': instance.other,
    };
