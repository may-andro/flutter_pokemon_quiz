import 'package:domain/domain.dart';
import 'package:ui_core/ui_core.dart';

class SettingViewModel extends BaseViewModel {
  SettingViewModel(
    this._isFeatureEnabledUseCase,
    this._buildConfig,
  );

  final IsFeatureEnabledUseCase _isFeatureEnabledUseCase;
  final BuildConfig _buildConfig;

  bool _isDeveloperModeEnabled = false;
  bool _isFeedbackFeatureEnabled = false;

  bool get isDeveloperModeEnabled => _isDeveloperModeEnabled;

  bool get isFeedbackFeatureEnabled => _isFeedbackFeatureEnabled;

  String get privacyPolicy {
    switch (_buildConfig.buildFlavor) {
      case BuildFlavor.jhoto:
        return 'https://pages.flycricket.io/johto-pokemon-quiz/privacy.html';
      case BuildFlavor.kanto:
        return 'https://pages.flycricket.io/pokemon-kanto-quiz/privacy.html';
    }
  }

  String get termsAndConditions {
    switch (_buildConfig.buildFlavor) {
      case BuildFlavor.jhoto:
        return 'https://pages.flycricket.io/johto-pokemon-quiz/terms.html';
      case BuildFlavor.kanto:
        return 'https://pages.flycricket.io/pokemon-kanto-quiz/terms.html';
    }
  }

  void onInit() {
    _isDeveloperModeEnabled = _isFeatureEnabledUseCase(Feature.developer_mode);
    _isFeedbackFeatureEnabled = _isFeatureEnabledUseCase(Feature.user_feedback);
    notifyListener();
  }
}
