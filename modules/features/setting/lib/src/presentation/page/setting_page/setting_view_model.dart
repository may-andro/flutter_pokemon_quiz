import 'package:domain/domain.dart';
import 'package:ui_core/ui_core.dart';

class SettingViewModel extends BaseViewModel {
  SettingViewModel(this._isFeatureEnabledUseCase);

  final IsFeatureEnabledUseCase _isFeatureEnabledUseCase;

  bool _isDeveloperModeEnabled = false;
  bool _isFeedbackFeatureEnabled = false;

  bool get isDeveloperModeEnabled => _isDeveloperModeEnabled;

  bool get isFeedbackFeatureEnabled => _isFeedbackFeatureEnabled;

  void onInit() {
    _isDeveloperModeEnabled = _isFeatureEnabledUseCase(Feature.developer_mode);
    _isFeedbackFeatureEnabled = _isFeatureEnabledUseCase(Feature.user_feedback);
    notifyListener();
  }
}
