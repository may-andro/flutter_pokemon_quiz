import 'package:domain/src/model/pokemon/pokemon_stat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int index,
    required String name,
    required int baseExperience,
    required int weight,
    required int height,
    required String imageUrl,
    required List<String> abilities,
    required List<String> moves,
    required List<String> types,
    required List<PokemonStat> stats,
    required bool isFavorite,
    required bool isCaptured,
  }) = _Pokemon;
}
