import 'package:domain/src/model/feature_toggle/feature.dart';
import 'package:equatable/equatable.dart';

class FeatureConfig extends Equatable {
  const FeatureConfig(this.isEnabled, this.feature);

  final bool isEnabled;
  final Feature feature;

  @override
  List<Object> get props => [isEnabled, feature];
}
