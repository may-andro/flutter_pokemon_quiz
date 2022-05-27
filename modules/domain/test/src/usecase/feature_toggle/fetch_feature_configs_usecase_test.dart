import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/repository/feature_toggle/fake_feature_toggle_repository.dart';

void main() {
  group(FetchFeatureConfigsUseCase, () {
    late FeatureToggleRepository featureToggleRepository;

    late FetchFeatureConfigsUseCase fetchFeatureConfigsUseCase;

    setUp(() {
      featureToggleRepository = FakeFeatureToggleRepository();

      fetchFeatureConfigsUseCase = FetchFeatureConfigsUseCase(
        featureToggleRepository,
      );
    });

    group('call', () {
      test('should return list of $FeatureConfig', () {
        final result = fetchFeatureConfigsUseCase.call();

        expect(result, featureToggleRepository.remoteFeatureConfigs);
      });
    });
  });
}
