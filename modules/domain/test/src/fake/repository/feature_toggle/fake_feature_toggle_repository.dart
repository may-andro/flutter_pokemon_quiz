import 'package:domain/src/model/feature_toggle/feature.dart';
import 'package:domain/src/model/feature_toggle/feature_config.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';

class FakeFeatureToggleRepository implements FeatureToggleRepository {
  final _featureToggles = [
    const FeatureConfig(isEnabled: true, feature: Feature.pokemon_detail),
    const FeatureConfig(isEnabled: false, feature: Feature.pokedex),
    const FeatureConfig(isEnabled: true, feature: Feature.developer_mode),
    const FeatureConfig(isEnabled: false, feature: Feature.user_feedback),
  ];

  @override
  void disableFeatureToggle(Feature feature) {
    final searchedFeature =
        _featureToggles.firstWhere((element) => element.feature == feature);
    final featureConfig = searchedFeature.copyWith(isEnabled: false);
    _featureToggles.remove(searchedFeature);
    _featureToggles.add(featureConfig);
  }

  @override
  void enableFeatureToggle(Feature feature) {
    final searchedFeature =
        _featureToggles.firstWhere((element) => element.feature == feature);
    final featureConfig = searchedFeature.copyWith(isEnabled: true);
    _featureToggles.remove(searchedFeature);
    _featureToggles.add(featureConfig);
  }

  @override
  bool getFeatureToggleValue(Feature feature) {
    final searchedFeature =
        _featureToggles.firstWhere((element) => element.feature == feature);
    return searchedFeature.isEnabled;
  }

  @override
  List<FeatureConfig> get remoteFeatureConfigs => _featureToggles;
}
