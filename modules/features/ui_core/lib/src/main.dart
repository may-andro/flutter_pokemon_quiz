import 'package:get_it/get_it.dart';
import 'package:ui_core/src/di/ui_core_locator.dart';

late GetIt uiCoreLocator;

void setupUiCoreModule(final GetIt getIt) {
  uiCoreLocator = getIt;
  setupUiCoreDependencies(getIt);
}
