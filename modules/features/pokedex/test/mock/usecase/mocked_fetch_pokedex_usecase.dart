import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockedFetchPokedexUseCase extends Mock implements FetchPokedexUseCase {
  void mockCall(Either<Failure, List<Pokemon>> expected) {
    when(() => call(any())).thenAnswer((_) => Future.value(expected));
  }
}
