import 'package:get_it/get_it.dart';
import 'package:ui_core/ui_core.dart';

final getIt = GetIt.instance;

void setupAppModule(final BuildConfig buildConfig) {
  getIt.registerLazySingleton(() => buildConfig);
}
