import 'package:domain/src/model/feature_toggle/feature.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_config.freezed.dart';

@freezed
class FeatureConfig with _$FeatureConfig {
  const factory FeatureConfig({
    required bool isEnabled,
    required Feature feature,
  }) = _FeatureConfig;
}
