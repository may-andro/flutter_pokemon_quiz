import 'package:pokedex_builder/domain/model/response.dart';

import 'di/locator.dart';
import 'domain/model/pokemon.dart';
import 'domain/usecase/fetch_pokedex_usecase.dart';

Future<List<Pokemon>> fetchPokemon(int startIndex, int endIndex) async {
  setupLocator();

  final fetchPokedexUseCase = locator.get<FetchPokedexUseCase>();
  final fetchPokedexUseCaseParam = FetchPokedexUseCaseParam(
    startIndex,
    endIndex,
  );
  final pokedexResponse = await fetchPokedexUseCase(fetchPokedexUseCaseParam);

  if (pokedexResponse.isFailure) throw (pokedexResponse as Failure).error;

  return (pokedexResponse as Success).data;
}
