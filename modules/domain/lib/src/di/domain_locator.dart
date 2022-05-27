import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:get_it/get_it.dart';

void setupDomainDependencies(final GetIt getIt) {
  _setUpUseCases(getIt);
}

void _setUpUseCases(final GetIt getIt) {
  getIt.registerFactory(
    () => FetchPokedexEndIndexUseCase(getIt.get<BuildConfig>()),
  );
  getIt.registerFactory(
    () => FetchPokedexStartIndexUseCase(getIt.get<BuildConfig>()),
  );
  getIt.registerFactory(
    () => FetchPokedexUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
      getIt.get<BuildConfig>(),
    ),
  );
  getIt.registerFactory(
    () => AddFavoritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
  getIt.registerFactory(
    () => RemoveFavoritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
  getIt.registerFactory(
    () => FetchPokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
  getIt.registerFactory(
    () => IsFeatureEnabledUseCase(
      getIt.get<FeatureToggleRepository>(
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
    ),
  );
  getIt.registerFactory(
    () => FetchFeatureConfigsUseCase(
      getIt.get<FeatureToggleRepository>(
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
    ),
  );
  getIt.registerFactory(
    () => EnableFeatureToggleUseCase(
      getIt.get<FeatureToggleRepository>(
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
    ),
  );
  getIt.registerFactory(
    () => DisableFeatureToggleUseCase(
      getIt.get<FeatureToggleRepository>(
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
    ),
  );
  getIt.registerFactory(
    () => IsFavoritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
  getIt.registerFactory(
    () => IsCapturedPokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
  getIt.registerFactory(
    () => CapturePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
}
