import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/src/data/fetch_pokemons_usecase.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';

void setupFeaturePokedexDependencies(final GetIt getIt) {
  getIt.registerFactory(
    () => PokedexViewModel(
      getIt.get<FetchPokemonsUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => FetchPokemonsUseCase(
      getIt.get<FetchPokedexUseCase>(),
      getIt.get<IsCapturedPokemonUseCase>(),
      getIt.get<BuildConfig>(),
    ),
  );
}
