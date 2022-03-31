import 'package:setting/src/domain/get_feature_toggle_description_use_case.dart';
import 'package:setting/src/domain/get_feature_toggle_title_use_case.dart';
import 'package:ui_core/ui_core.dart';
import 'package:domain/domain.dart';

class DeveloperViewModel extends BaseViewModel {
  DeveloperViewModel(
    this._fetchFeatureConfigsUseCase,
    this._getFeatureToggleDescriptionUseCase,
    this._getFeatureToggleTitleUseCase,
    this._enableFeatureToggleUseCase,
    this._disableFeatureToggleUseCase,
  );

  final FetchFeatureConfigsUseCase _fetchFeatureConfigsUseCase;
  final GetFeatureToggleTitleUseCase _getFeatureToggleTitleUseCase;
  final GetFeatureToggleDescriptionUseCase _getFeatureToggleDescriptionUseCase;
  final EnableFeatureToggleUseCase _enableFeatureToggleUseCase;
  final DisableFeatureToggleUseCase _disableFeatureToggleUseCase;

  late List<FeatureConfig> _featureConfigs;
  late int _errorCode;

  List<FeatureConfig> get featureConfigs => _featureConfigs;

  int get errorCode => _errorCode;

  bool get isPokedexEnabled => true;

  bool get isPokemonDetailEnabled => true;

  void onInit() {
    _loadFeatureConfigs();
  }

  void _loadFeatureConfigs() {
    _featureConfigs = _fetchFeatureConfigsUseCase();
    setSuccessState();
  }

  void toggleFeature(bool isEnabled, Feature feature) {
    if (isEnabled) {
      _enableFeatureToggleUseCase(feature);
    } else {
      _disableFeatureToggleUseCase(feature);
    }
    _loadFeatureConfigs();
  }

  String getFeatureTitle(Feature feature) {
    return _getFeatureToggleTitleUseCase.call(feature);
  }

  String getFeatureDescription(Feature feature) {
    return _getFeatureToggleDescriptionUseCase.call(feature);
  }
}
