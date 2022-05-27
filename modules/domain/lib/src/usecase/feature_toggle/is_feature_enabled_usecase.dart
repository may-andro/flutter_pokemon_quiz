import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';

class IsFeatureEnabledUseCase {
  IsFeatureEnabledUseCase(this._featureToggleRepository);

  final FeatureToggleRepository _featureToggleRepository;

  bool call(Feature feature) {
    return _featureToggleRepository.getFeatureToggleValue(feature);
  }
}
