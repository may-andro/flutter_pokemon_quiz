import 'package:data/data.dart';

class IsCapturedPokemonUseCase {
  IsCapturedPokemonUseCase(
    this._pokemonRepository,
  );

  final PokemonRepository _pokemonRepository;

  bool call(int pokemonIndex) {
    return _pokemonRepository.queryIsCapturedPokemon(pokemonIndex);
  }
}
