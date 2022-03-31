import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';

class EnableFeatureToggleUseCase {
  EnableFeatureToggleUseCase(
    this._featureToggleRepository,
    this._featureToggleMapper,
  );

  final FeatureToggleRepository _featureToggleRepository;
  final FeatureToggleMapper _featureToggleMapper;

  void call(Feature feature) {
    return _featureToggleRepository.enableFeatureToggle(
      _featureToggleMapper.mapFromModelToEntity(feature),
    );
  }
}
