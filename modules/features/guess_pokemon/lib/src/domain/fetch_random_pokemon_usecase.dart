import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class FetchRandomPokemonUseCase {
  FetchRandomPokemonUseCase(
    this._fetchPokemonUseCase,
    this._fetchPokedexStartIndexUseCase,
    this._fetchPokedexEndIndexUseCase,
  );

  final FetchPokemonUseCase _fetchPokemonUseCase;
  final FetchPokedexStartIndexUseCase _fetchPokedexStartIndexUseCase;
  final FetchPokedexEndIndexUseCase _fetchPokedexEndIndexUseCase;

  Future<Either<Failure, Pokemon>> call() async {
    int randomIndex = random();
    return _fetchPokemonUseCase(randomIndex);
  }

  int random() {
    int startIndex = _fetchPokedexStartIndexUseCase();
    int endIndex = _fetchPokedexEndIndexUseCase();
    return startIndex + Random().nextInt(endIndex - startIndex);
  }
}
