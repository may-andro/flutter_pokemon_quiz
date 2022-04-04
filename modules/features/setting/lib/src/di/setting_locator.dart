import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:setting/src/domain/get_feature_toggle_description_use_case.dart';
import 'package:setting/src/domain/get_feature_toggle_title_use_case.dart';
import 'package:setting/src/presentation/page/developer_page/developer_view_model.dart';
import 'package:setting/src/presentation/page/setting_page/setting_view_model.dart';

void setupFeatureDependencies(final GetIt getIt) {
  _injectViewModel(getIt);
  _injectUseCase(getIt);
}

void _injectUseCase(GetIt getIt) {
  getIt.registerFactory(() => GetFeatureToggleDescriptionUseCase());
  getIt.registerFactory(() => GetFeatureToggleTitleUseCase());
}

void _injectViewModel(GetIt getIt) {
  getIt.registerFactory(
    () => DeveloperViewModel(
      getIt.get<FetchFeatureConfigsUseCase>(),
      getIt.get<GetFeatureToggleDescriptionUseCase>(),
      getIt.get<GetFeatureToggleTitleUseCase>(),
      getIt.get<EnableFeatureToggleUseCase>(),
      getIt.get<DisableFeatureToggleUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => SettingViewModel(
      getIt.get<IsFeatureEnabledUseCase>(),
      getIt.get<BuildConfig>(),
    ),
  );
}
