import 'package:guess_pokemon/src/domain/random_number_generator_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockedRandomNumberGeneratorUseCase extends Mock
    implements RandomNumberGeneratorUseCase {
  void mockCall(int expected) {
    when(
      () => call(start: any(named: 'start'), end: any(named: 'end')),
    ).thenReturn(expected);
  }
}
