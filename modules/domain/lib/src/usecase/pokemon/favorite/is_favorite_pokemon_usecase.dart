import 'package:domain/src/repository/pokemon/pokemon_repository.dart';

class IsFavoritePokemonUseCase {
  IsFavoritePokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  bool call(int pokemonIndex) {
    return _pokemonRepository.isFavoritePokemon(pokemonIndex);
  }
}
