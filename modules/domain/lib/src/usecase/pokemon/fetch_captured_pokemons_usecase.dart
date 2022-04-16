import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/pokedex/fetch_pokedex_usecase.dart';

class FetchCapturedPokemonsUseCase {
  FetchCapturedPokemonsUseCase(this._fetchPokedexUseCase);

  final FetchPokedexUseCase _fetchPokedexUseCase;

  Future<Either<Failure, List<Pokemon>>> call(String region) async {
    final eitherPokedex = await _fetchPokedexUseCase(region);
    if (eitherPokedex.isRight()) {
      final pokemons = eitherPokedex
          .asRight()
          .pokemons
          .where((pokemon) => pokemon.isCaptured)
          .toList();
      return Right(pokemons);
    }
    return const Left(Failure(ERROR_SERVER_ID));
  }
}
