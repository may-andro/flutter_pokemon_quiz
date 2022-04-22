import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_view_model.dart';

import '../../mock/usecase/mocked_is_feature_enabled_usecase.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(Feature.pokemon_detail);
  });

  group(SplashViewModel, () {
    late MockedIsFeatureEnabledUseCase mockedIsFeatureEnabledUseCase;

    late SplashViewModel splashViewModel;

    setUp(() {
      mockedIsFeatureEnabledUseCase = MockedIsFeatureEnabledUseCase();

      splashViewModel = SplashViewModel(mockedIsFeatureEnabledUseCase);
    });

    tearDown(() => splashViewModel.dispose());

    group('isPokedexFeatureEnabled', () {
      test('should call $IsFeatureEnabledUseCase', () {
        mockedIsFeatureEnabledUseCase.mockCall(false);

        splashViewModel.isPokedexFeatureEnabled;

        verify(
          () => mockedIsFeatureEnabledUseCase.call(any()),
        ).called(1);
      });

      test('should return true when $IsFeatureEnabledUseCase return true', () {
        mockedIsFeatureEnabledUseCase.mockCall(true);

        final result = splashViewModel.isPokedexFeatureEnabled;

        expect(result, isTrue);
      });

      test('should return false when $IsFeatureEnabledUseCase return false',
          () {
        mockedIsFeatureEnabledUseCase.mockCall(false);

        final result = splashViewModel.isPokedexFeatureEnabled;

        expect(result, isFalse);
      });
    });
  });
}
