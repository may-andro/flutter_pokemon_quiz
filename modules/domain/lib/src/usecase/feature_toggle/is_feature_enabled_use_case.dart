import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class IsFeatureEnabledUseCase {
  IsFeatureEnabledUseCase(
    this._featureToggleRepository,
    this._featureToggleMapper,
  );

  final FeatureToggleRepository _featureToggleRepository;
  final FeatureToggleMapper _featureToggleMapper;

  bool call(Feature feature) {
    return _featureToggleRepository.getFeatureToggleValue(
      _featureToggleMapper.mapFromModelToEntity(feature),
    );
  }
}
