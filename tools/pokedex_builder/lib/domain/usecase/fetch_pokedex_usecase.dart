import 'package:pokedex_builder/domain/extension/failure_extension.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/domain/usecase/fetch_pokedex_end_index_usecase.dart';
import 'package:pokedex_builder/domain/usecase/fetch_pokedex_start_index_usecase.dart';
import 'package:pokedex_builder/domain/usecase/fetch_pokemon_usecase.dart';
import 'package:pokedex_builder/logger/tool_logger.dart';

class FetchPokedexUseCase {
  FetchPokedexUseCase(
    this._fetchPokemonUseCase,
    this._fetchPokedexStartIndexUseCase,
    this._fetchPokedexEndIndexUseCase,
    this._toolLogger,
  );

  final FetchPokemonUseCase _fetchPokemonUseCase;
  final FetchPokedexStartIndexUseCase _fetchPokedexStartIndexUseCase;
  final FetchPokedexEndIndexUseCase _fetchPokedexEndIndexUseCase;
  final ToolLogger _toolLogger;

  Future<List<Pokemon>> call(final String region) async {
    final startIndex = _fetchPokedexStartIndexUseCase(region);
    final endIndex = _fetchPokedexEndIndexUseCase(region);
    var index = startIndex;
    final pokedex = <Pokemon>[];
    while (index <= endIndex) {
      final eitherPokemon = await _fetchPokemonUseCase(index);
      if (eitherPokemon.isRight()) {
        pokedex.add((eitherPokemon.asRight()));
        index++;
      } else {
        final failure = eitherPokemon.asLeft();
        _toolLogger.e(
          'Failed to fetch pokemon at index: $index',
          exception: failure.exception,
          stacktrace: failure.stackTrace,
        );
        throw failure.exception;
      }
    }
    return pokedex;
  }
}
