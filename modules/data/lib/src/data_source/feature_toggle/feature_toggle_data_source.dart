import 'package:network/network.dart';

abstract class FeatureToggleDataSource {
  bool getFeatureToggleValue(RemoteConfigFeature remoteConfigFeature);

  void enableFeatureToggleValue(RemoteConfigFeature remoteConfigFeature);

  void disableFeatureToggleValue(RemoteConfigFeature remoteConfigFeature);

  Map<RemoteConfigFeature, bool> get remoteConfigFeatures;
}
