import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/repository/feature_toggle/mocked_feature_toggle_repository.dart';

void main() {
  group(DisableFeatureToggleUseCase, () {
    late MockedFeatureToggleRepository mockedFeatureToggleRepository;
    late FeatureToggleMapper featureToggleMapper;

    late DisableFeatureToggleUseCase disableFeatureToggleUseCase;

    setUp(() {
      featureToggleMapper = FeatureToggleMapper();
      mockedFeatureToggleRepository = MockedFeatureToggleRepository();

      disableFeatureToggleUseCase = DisableFeatureToggleUseCase(
        mockedFeatureToggleRepository,
        featureToggleMapper,
      );
    });

    group('call', () {
      test('should call $FeatureToggleRepository', () {
        disableFeatureToggleUseCase.call(Feature.pokedex);
        verify(
          () => mockedFeatureToggleRepository.disableFeatureToggle(
            featureToggleMapper.mapFromModelToEntity(Feature.pokedex),
          ),
        ).called(1);
      });
    });
  });
}
