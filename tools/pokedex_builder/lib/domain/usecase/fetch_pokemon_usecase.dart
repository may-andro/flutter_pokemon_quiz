import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/domain/model/response.dart';
import 'package:pokedex_builder/domain/repository/pokemon_repository.dart';
import 'package:pokedex_builder/domain/usecase/usecase.dart';

class FetchPokemonUseCase implements UseCase<int, Pokemon> {
  FetchPokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  @override
  Future<Response<Pokemon>> call(int param) {
    return _pokemonRepository.getPokemon(index: param);
  }
}
