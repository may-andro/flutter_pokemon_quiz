import 'package:domain/src/model/pokemon/pokemon.dart';
import 'package:equatable/equatable.dart';

class Pokedex extends Equatable {
  const Pokedex({required this.pokemons});

  final List<Pokemon> pokemons;

  @override
  List<Object?> get props => [pokemons];
}
