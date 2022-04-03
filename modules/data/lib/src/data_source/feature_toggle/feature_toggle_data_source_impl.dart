import 'package:data/src/data_source/feature_toggle/feature_toggle_data_source.dart';
import 'package:network/network.dart';

class FeatureToggleDataSourceImpl implements FeatureToggleDataSource {
  FeatureToggleDataSourceImpl(RemoteConfigClient _remoteConfigClient)
      : _cachedRemoteFeatureConfigs = {
          for (var remoteConfigFeature in RemoteConfigFeature.values)
            remoteConfigFeature: _remoteConfigClient.getValue(
              remoteConfigFeature,
            )
        };

  final Map<RemoteConfigFeature, bool> _cachedRemoteFeatureConfigs;

  @override
  bool getFeatureToggleValue(RemoteConfigFeature remoteConfigFeature) {
    return _cachedRemoteFeatureConfigs[remoteConfigFeature] ?? false;
  }

  @override
  Map<RemoteConfigFeature, bool> get remoteConfigFeatures =>
      _cachedRemoteFeatureConfigs;

  @override
  void disableFeatureToggleValue(RemoteConfigFeature remoteConfigFeature) {
    _cachedRemoteFeatureConfigs[remoteConfigFeature] = false;
  }

  @override
  void enableFeatureToggleValue(RemoteConfigFeature remoteConfigFeature) {
    _cachedRemoteFeatureConfigs[remoteConfigFeature] = true;
  }
}
