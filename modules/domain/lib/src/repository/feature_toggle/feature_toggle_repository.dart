import 'package:domain/src/model/model.dart';

abstract class FeatureToggleRepository {
  bool getFeatureToggleValue(Feature feature);

  void enableFeatureToggle(Feature feature);

  void disableFeatureToggle(Feature feature);

  List<FeatureConfig> get remoteFeatureConfigs;
}
