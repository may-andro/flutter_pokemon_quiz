import 'package:data/src/mapper/feature_toggle/feature_toggle_mapper.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

void main() {
  group(FeatureToggleMapper, () {
    late FeatureToggleMapper featureToggleMapper;

    setUp(() {
      featureToggleMapper = FeatureToggleMapper();
    });

    group('mapFromEntityToModel', () {
      test('should map $RemoteConfigFeature to $Feature', () {
        const remoteConfigFeature =
            RemoteConfigFeature.feature_toggle_developer_option;

        final result =
            featureToggleMapper.mapFromEntityToModel(remoteConfigFeature);

        expect(result, Feature.developer_mode);
      });
    });

    group('mapFromModelToEntity', () {
      test('should map $Feature to $RemoteConfigFeature', () {
        const feature = Feature.developer_mode;

        final result = featureToggleMapper.mapFromModelToEntity(feature);

        expect(result, RemoteConfigFeature.feature_toggle_developer_option);
      });
    });
  });
}
