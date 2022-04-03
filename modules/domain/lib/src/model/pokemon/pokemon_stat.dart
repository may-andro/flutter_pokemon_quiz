import 'package:equatable/equatable.dart';

class PokemonStat extends Equatable {
  const PokemonStat({
    required this.baseStat,
    required this.effort,
    required this.name,
  });

  final int baseStat;

  final int effort;

  final String name;

  @override
  List<Object?> get props => [baseStat, effort, name];
}
