import 'package:get_it/get_it.dart';
import 'package:pokemon_quiz/app/pq_app_view_model.dart';
import 'package:ui_core/ui_core.dart';

final getIt = GetIt.instance;

void setupAppModule(final BuildConfig buildConfig) {
  getIt.registerLazySingleton(() => buildConfig);
  _injectAppTheme();
  _injectAppViewModel();
}

void _injectAppTheme() {
  getIt.registerLazySingleton<ColorPalette>(
    DarkColorPalette.new,
    instanceName: 'DarkColorPalette',
  );
  getIt.registerLazySingleton<ColorPalette>(
    LightColorPalette.new,
    instanceName: 'LightColorPalette',
  );
  getIt.registerLazySingleton(
    () => AppTheme(
      getIt.get(instanceName: 'DarkColorPalette'),
      getIt.get(instanceName: 'LightColorPalette'),
    ),
  );
}

void _injectAppViewModel() {
  getIt.registerFactory(PQAppViewModel.new);
}
