import 'package:pokedex_builder/logger/tool_logger.dart';

import 'di/locator.dart';
import 'domain/model/pokemon.dart';
import 'domain/usecase/fetch_pokedex_usecase.dart';

void setupPokedexBuilder() {
  setupLocator();
}

Future<List<Pokemon>> fetchPokemon(final String region) async {
  final fetchPokedexUseCase = locator.get<FetchPokedexUseCase>();
  return await fetchPokedexUseCase(region);
}

void logInfo(String message) {
  final toolLogger = locator.get<ToolLogger>();
  toolLogger.d(message);
}

void logError(String message) {
  final toolLogger = locator.get<ToolLogger>();
  toolLogger.e(message);
}
