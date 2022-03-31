import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/mapper/mapper.dart';

class FetchFeatureConfigsUseCase {
  FetchFeatureConfigsUseCase(
    this._featureToggleRepository,
    this._featureToggleMapper,
  );

  final FeatureToggleRepository _featureToggleRepository;
  final FeatureToggleMapper _featureToggleMapper;

  List<FeatureConfig> call() {
    final featureConfig = <FeatureConfig>[];
    final remoteFeatureConfigs = _featureToggleRepository.remoteFeatureConfigs;

    remoteFeatureConfigs.forEach(
      (remoteConfigFeature, isEnabled) => featureConfig.add(
        FeatureConfig(
          isEnabled,
          _featureToggleMapper.mapFromEntityToModel(
            remoteConfigFeature,
          ),
        ),
      ),
    );

    return featureConfig;
  }
}
