import 'package:domain/src/model/feature_toggle/feature.dart';

class FeatureConfig {
  FeatureConfig(this.isEnabled, this.feature);

  final bool isEnabled;
  final Feature feature;
}
