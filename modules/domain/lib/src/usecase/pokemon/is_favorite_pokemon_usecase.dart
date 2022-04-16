import 'package:data/data.dart';

class IsFavoritePokemonUseCase {
  IsFavoritePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  bool call(int pokemonIndex) {
    return _pokemonRepository.queryIsFavoritePokemon(pokemonIndex);
  }
}
