import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockedCapturePokemonUseCase extends Mock
    implements CapturePokemonUseCase {
  void mockCall(Either<Failure, Pokemon> expected) {
    when(() => call(any())).thenReturn(expected);
  }
}
