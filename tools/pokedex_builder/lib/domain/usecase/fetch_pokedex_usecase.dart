import 'package:pokedex_builder/domain/usecase/usecase.dart';

import '../model/pokemon.dart';
import '../model/response.dart';
import 'fetch_pokemon_usecase.dart';

class FetchPokedexUseCase
    implements UseCase<FetchPokedexUseCaseParam, List<Pokemon>> {
  FetchPokedexUseCase(this._fetchPokemonUseCase);

  final FetchPokemonUseCase _fetchPokemonUseCase;

  @override
  Future<Response<List<Pokemon>>> call(FetchPokedexUseCaseParam param) async {
    var index = param.startIndex;
    final pokedex = <Pokemon>[];
    while (index <= param.endIndex) {
      final pokemon = await _fetchPokemonUseCase(index);
      if (pokemon.isFailure) {
        throw (pokemon as Failure).error;
      }

      if (pokemon.isSuccess) {
        pokedex.add((pokemon as Success).data);
      }

      index++;
    }
    return Success(data: pokedex);
  }
}

class FetchPokedexUseCaseParam {
  FetchPokedexUseCaseParam(
    this.startIndex,
    this.endIndex,
  );

  final int startIndex;
  final int endIndex;
}
