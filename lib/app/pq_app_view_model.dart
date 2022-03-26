import 'package:pokemon_quiz/di/locator.dart';
import 'package:ui_core/ui_core.dart';

class PQAppViewModel extends BaseViewModel {
  late AppTheme _appTheme;

  AppTheme get appTheme => _appTheme;

  void onInit() {
    _appTheme = getIt.get<AppTheme>();
  }
}
