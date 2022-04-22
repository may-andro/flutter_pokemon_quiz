import 'package:domain/domain.dart';
import 'package:guess_pokemon/src/domain/fetch_random_pokemon_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockedFetchRandomPokemonUseCase extends Mock
    implements FetchRandomPokemonUseCase {
  void mockCall(Either<Failure, Pokemon> expected) {
    when(() => call()).thenAnswer((_) => Future.value(expected));
  }
}
