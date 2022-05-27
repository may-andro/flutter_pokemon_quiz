import 'package:domain/domain.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';

class FetchFeatureConfigsUseCase {
  FetchFeatureConfigsUseCase(this._featureToggleRepository);

  final FeatureToggleRepository _featureToggleRepository;

  List<FeatureConfig> call() {
    return _featureToggleRepository.remoteFeatureConfigs;
  }
}
