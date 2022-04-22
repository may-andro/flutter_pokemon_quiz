import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:guess_pokemon/src/domain/random_number_generator_usecase.dart';

class FetchRandomPokemonUseCase {
  FetchRandomPokemonUseCase(
    this._fetchPokemonUseCase,
    this._fetchPokedexStartIndexUseCase,
    this._fetchPokedexEndIndexUseCase,
    this._randomNumberGeneratorUseCase,
  );

  final FetchPokemonUseCase _fetchPokemonUseCase;
  final FetchPokedexStartIndexUseCase _fetchPokedexStartIndexUseCase;
  final FetchPokedexEndIndexUseCase _fetchPokedexEndIndexUseCase;
  final RandomNumberGeneratorUseCase _randomNumberGeneratorUseCase;

  Future<Either<Failure, Pokemon>> call() async {
    int randomIndex = _randomNumberGeneratorUseCase(
      start: _fetchPokedexStartIndexUseCase(),
      end: _fetchPokedexEndIndexUseCase(),
    );
    return _fetchPokemonUseCase(randomIndex);
  }
}
