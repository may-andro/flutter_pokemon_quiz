import 'package:domain/domain.dart';
import 'package:ui_core/ui_core.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel(this._isFeatureEnabledUseCase);

  final IsFeatureEnabledUseCase _isFeatureEnabledUseCase;

  bool get isPokedexFeatureEnabled => _isFeatureEnabledUseCase(Feature.pokedex);
}
