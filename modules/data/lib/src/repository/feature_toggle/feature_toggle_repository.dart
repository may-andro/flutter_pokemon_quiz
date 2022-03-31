import 'package:network/network.dart';

abstract class FeatureToggleRepository {
  bool getFeatureToggleValue(RemoteConfigFeature remoteConfigFeature);

  void enableFeatureToggle(RemoteConfigFeature remoteConfigFeature);

  void disableFeatureToggle(RemoteConfigFeature remoteConfigFeature);

  Map<RemoteConfigFeature, bool> get remoteFeatureConfigs;
}
