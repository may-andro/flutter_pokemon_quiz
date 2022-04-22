import 'package:mocktail/mocktail.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_view_model.dart';

class MockedSplashViewModel extends Mock implements SplashViewModel {
  void mockIsPokedexFeatureEnabled(bool expected) {
    when(() => isPokedexFeatureEnabled).thenReturn(expected);
  }
}
