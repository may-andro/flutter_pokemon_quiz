import 'package:domain/src/usecase/pokemon/is_favorite_pokemon_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockedIsFavoritePokemonUseCase extends Mock
    implements IsFavoritePokemonUseCase {
  void mockCall(bool expected) {
    when(() => call(any())).thenReturn(expected);
  }
}
