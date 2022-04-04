import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_view_model.dart';

final getIt = GetIt.instance;

void setupAppModule(final BuildConfig buildConfig) {
  getIt.registerLazySingleton(() => buildConfig);

  getIt.registerFactory(() => SplashViewModel(getIt.get()));
}
