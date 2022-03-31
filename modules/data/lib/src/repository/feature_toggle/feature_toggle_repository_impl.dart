import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/repository/feature_toggle/feature_toggle_repository.dart';
import 'package:network/network.dart';

class FeatureToggleRepositoryImpl implements FeatureToggleRepository {
  FeatureToggleRepositoryImpl(this._featureToggleDataSource);

  final FeatureToggleDataSource _featureToggleDataSource;

  @override
  bool getFeatureToggleValue(RemoteConfigFeature remoteConfigFeature) {
    return _featureToggleDataSource.getFeatureToggleValue(remoteConfigFeature);
  }

  @override
  Map<RemoteConfigFeature, bool> get remoteFeatureConfigs {
    return _featureToggleDataSource.remoteConfigFeatures;
  }

  @override
  void disableFeatureToggle(RemoteConfigFeature remoteConfigFeature) {
    _featureToggleDataSource.disableFeatureToggleValue(remoteConfigFeature);
  }

  @override
  void enableFeatureToggle(RemoteConfigFeature remoteConfigFeature) {
    _featureToggleDataSource.enableFeatureToggleValue(remoteConfigFeature);
  }
}
