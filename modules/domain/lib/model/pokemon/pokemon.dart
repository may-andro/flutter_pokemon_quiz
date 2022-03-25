import 'package:domain/model/pokemon/pokemon_stat.dart';

class Pokemon {
  Pokemon({
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
}
