import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:ui_core/ui_core.dart';

void setupFeaturePokedexDependencies(final GetIt getIt) {
  getIt.registerFactory(
    () => PokedexViewModel(
      getIt.get<FetchPokedexUseCase>(),
      getIt.get<BuildConfig>(),
    ),
  );
}
