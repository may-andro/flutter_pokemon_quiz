import 'package:domain/src/model/pokemon/pokemon_stat.dart';
import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  const Pokemon({
    required this.index,
    required this.name,
    required this.baseExperience,
    required this.weight,
    required this.height,
    required this.imageUrl,
    required this.abilities,
    required this.moves,
    required this.types,
    required this.stats,
    required this.isFavorite,
    required this.isCaptured,
  });

  final int index;

  final String name;

  final int baseExperience;

  final int weight;

  final int height;

  final String imageUrl;

  final List<String> abilities;

  final List<String> moves;

  final List<String> types;

  final List<PokemonStat> stats;

  final bool isCaptured;

  final bool isFavorite;

  @override
  List<Object?> get props => [
        index,
        name,
        baseExperience,
        weight,
        height,
        imageUrl,
        abilities,
        moves,
        types,
        stats,
        isCaptured,
        isFavorite,
      ];

  Pokemon copyWith({
    bool? isCaptured,
    bool? isFavorite,
  }) {
    return Pokemon(
      index: index,
      name: name,
      baseExperience: baseExperience,
      weight: weight,
      height: height,
      imageUrl: imageUrl,
      abilities: abilities,
      moves: moves,
      types: types,
      stats: stats,
      isCaptured: isCaptured ?? this.isCaptured,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
