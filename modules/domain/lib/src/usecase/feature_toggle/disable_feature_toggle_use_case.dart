import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class DisableFeatureToggleUseCase {
  DisableFeatureToggleUseCase(
    this._featureToggleRepository,
    this._featureToggleMapper,
  );

  final FeatureToggleRepository _featureToggleRepository;
  final FeatureToggleMapper _featureToggleMapper;

  void call(Feature feature) {
    return _featureToggleRepository.disableFeatureToggle(
      _featureToggleMapper.mapFromModelToEntity(feature),
    );
  }
}
