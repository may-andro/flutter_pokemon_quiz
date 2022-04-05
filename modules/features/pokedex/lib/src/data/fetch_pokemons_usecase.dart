import 'package:domain/domain.dart';

class FetchPokemonsUseCase {
  FetchPokemonsUseCase(
    this._fetchPokedexUseCase,
    this._isCapturedPokemonUseCase,
    this._buildConfig,
  );

  final FetchPokedexUseCase _fetchPokedexUseCase;
  final IsCapturedPokemonUseCase _isCapturedPokemonUseCase;
  final BuildConfig _buildConfig;

  Future<Map<Pokemon, bool>> call() async {
    final pokemonMap = <Pokemon, bool>{};

    final pokedexResponse = await _fetchPokedexUseCase.call(
      _buildConfig.buildFlavor.name,
    );

    if (pokedexResponse.isLeft()) {
      throw Exception();
    }

    if (pokedexResponse.isRight()) {
      final pokedex = pokedexResponse.asRight();
      pokedex.pokemons.forEach((pokemon) {
        var isCaptured = false;
        final capturedResponse = _isCapturedPokemonUseCase.call(pokemon.index);
        if (capturedResponse.isLeft()) {
          isCaptured = false;
        } else {
          isCaptured = capturedResponse.asRight();
        }
        pokemonMap[pokemon] = isCaptured;
      });
    }

    return pokemonMap;
  }
}
