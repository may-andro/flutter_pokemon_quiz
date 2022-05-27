import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stat.freezed.dart';

@freezed
class PokemonStat with _$PokemonStat {
  const factory PokemonStat({
    required int baseStat,
    required int effort,
    required String name,
  }) = _PokemonStat;
}
