import 'package:domain/src/usecase/pokemon/is_captured_pokemon_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockIsCapturedPokemonUseCase extends Mock
    implements IsCapturedPokemonUseCase {
  void mockCall(bool expected) {
    when(() => call(any())).thenReturn(expected);
  }
}
