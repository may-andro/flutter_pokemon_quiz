import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake/repository/feature_toggle/fake_feature_toggle_repository.dart';

void main() {
  group(EnableFeatureToggleUseCase, () {
    late FeatureToggleRepository featureToggleRepository;

    late EnableFeatureToggleUseCase enableFeatureToggleUseCase;

    setUp(() {
      featureToggleRepository = FakeFeatureToggleRepository();

      enableFeatureToggleUseCase = EnableFeatureToggleUseCase(
        featureToggleRepository,
      );
    });

    group('call', () {
      test('should set isEnabled to true for the $Feature', () {
        enableFeatureToggleUseCase.call(Feature.pokedex);

        expect(
          featureToggleRepository.getFeatureToggleValue(Feature.pokedex),
          isTrue,
        );
      });
    });
  });
}
