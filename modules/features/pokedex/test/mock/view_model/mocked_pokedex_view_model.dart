import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:ui_core/ui_core.dart';

class MockedPokedexViewModel extends Mock implements PokedexViewModel {
  void mockPokedex(List<Pokemon> expected) {
    when(() => pokemons).thenReturn(expected);
  }

  void mockErrorMessage(String expected) {
    when(() => errorMessage).thenReturn(expected);
  }

  void mockOnInit() {
    when(onInit).thenAnswer((_) => Future.value());
  }

  void mockViewState(ViewState expected) {
    when(() => viewState).thenReturn(expected);
  }

  void mockIsStateLoading(bool expected) {
    when(() => isStateLoading).thenReturn(expected);
  }

  void mockIsStateSuccess(bool expected) {
    when(() => isStateSuccess).thenReturn(expected);
  }

  void mockIsStateError(bool expected) {
    when(() => isStateError).thenReturn(expected);
  }
}
