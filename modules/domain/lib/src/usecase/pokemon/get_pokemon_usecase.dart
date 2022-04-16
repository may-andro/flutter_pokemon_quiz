import 'package:data/data.dart';
import 'package:local/local.dart';

class GetPokemonUseCase {
  GetPokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  LocalPokemon? call(int index) {
    return _pokemonRepository.getPokemon(index);
  }
}
