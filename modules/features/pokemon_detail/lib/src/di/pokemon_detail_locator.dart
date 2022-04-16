import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';

void setupFeatureDependencies(final GetIt getIt) {
  _injectViewModel(getIt);
}

void _injectViewModel(GetIt getIt) {
  getIt.registerFactory(
    () => PokemonDetailViewModel(
      getIt.get<PokemonTypeImageMapper>(),
      getIt.get<PokemonTypeColorMapper>(),
      getIt.get<IsFavoritePokemonUseCase>(),
      getIt.get<AddFavoritePokemonUseCase>(),
      getIt.get<RemoveFavoritePokemonUseCase>(),
    ),
  );
}
