import 'package:pokedex_builder/domain/usecase/usecase.dart';

import '../model/pokemon.dart';
import '../model/response.dart';
import '../repository/pokemon_repository.dart';

class FetchPokemonUseCase implements UseCase<int, Pokemon> {
  FetchPokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  @override
  Future<Response<Pokemon>> call(int param) {
    return _pokemonRepository.getPokemon(index: param);
  }
}
