import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';

class DisableFeatureToggleUseCase {
  DisableFeatureToggleUseCase(this._featureToggleRepository);

  final FeatureToggleRepository _featureToggleRepository;

  void call(Feature feature) {
    return _featureToggleRepository.disableFeatureToggle(feature);
  }
}
