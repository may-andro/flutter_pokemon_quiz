import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockedFetchPokemonUseCase extends Mock implements FetchPokemonUseCase {
  void mockCall(Either<Failure, Pokemon> expected) {
    when(() => call(any())).thenAnswer((_) => Future.value(expected));
  }
}
