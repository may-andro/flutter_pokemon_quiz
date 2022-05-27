import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/mapper/mapper.dart';
import 'package:domain/domain.dart';

class FeatureToggleRepositoryImpl implements FeatureToggleRepository {
  FeatureToggleRepositoryImpl(
    this._featureToggleDataSource,
    this._featureToggleMapper,
  );

  final FeatureToggleDataSource _featureToggleDataSource;
  final FeatureToggleMapper _featureToggleMapper;

  @override
  bool getFeatureToggleValue(Feature feature) {
    return _featureToggleDataSource.getFeatureToggleValue(
      _featureToggleMapper.mapFromModelToEntity(feature),
    );
  }

  @override
  List<FeatureConfig> get remoteFeatureConfigs {
    final featureConfig = <FeatureConfig>[];

    _featureToggleDataSource.remoteConfigFeatures.forEach(
      (remoteConfigFeature, isEnabled) => featureConfig.add(
        FeatureConfig(
          isEnabled: isEnabled,
          feature: _featureToggleMapper.mapFromEntityToModel(
            remoteConfigFeature,
          ),
        ),
      ),
    );
    return featureConfig;
  }

  @override
  void disableFeatureToggle(Feature feature) {
    _featureToggleDataSource.disableFeatureToggleValue(
      _featureToggleMapper.mapFromModelToEntity(feature),
    );
  }

  @override
  void enableFeatureToggle(Feature feature) {
    _featureToggleDataSource.enableFeatureToggleValue(
      _featureToggleMapper.mapFromModelToEntity(feature),
    );
  }
}
