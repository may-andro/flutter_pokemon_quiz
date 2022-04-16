import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:get_it/get_it.dart';

void setupDomainDependencies(final GetIt getIt) {
  _setupMappers(getIt);
  _setUpUseCases(getIt);
}

void _setupMappers(final GetIt getIt) {
  getIt.registerFactory(() => PokedexRemoteMapper(getIt.get()));
  getIt.registerFactory(
    () => ExtendedPokemonRemoteMapper(
      getIt.get<IsFavoritePokemonUseCase>(),
      getIt.get<IsCapturedPokemonUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => PokemonRemoteMapper(
      getIt.get(),
      getIt.get(),
      getIt.get(),
    ),
  );
  getIt.registerFactory(PokemonStatsRemoteMapper.new);
  getIt.registerFactory(FeatureToggleMapper.new);
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
      getIt.get<PokedexRepository>(instanceName: 'PokedexRepositoryImpl'),
      getIt.get<PokedexRemoteMapper>(),
    ),
  );
  getIt.registerFactory(
    () => AddFavoritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
  getIt.registerFactory(
    () => FetchFavoritePokemonsUseCase(getIt.get<FetchPokedexUseCase>()),
  );
  getIt.registerFactory(
    () => RemoveFavoritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
  getIt.registerFactory(
    () => FetchPokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
      getIt.get<ExtendedPokemonRemoteMapper>(),
    ),
  );
  getIt.registerFactory(
    () => IsFeatureEnabledUseCase(
      getIt.get<FeatureToggleRepository>(
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
      getIt.get<FeatureToggleMapper>(),
    ),
  );
  getIt.registerFactory(
    () => FetchFeatureConfigsUseCase(
      getIt.get<FeatureToggleRepository>(
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
      getIt.get<FeatureToggleMapper>(),
    ),
  );
  getIt.registerFactory(
    () => EnableFeatureToggleUseCase(
      getIt.get<FeatureToggleRepository>(
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
      getIt.get<FeatureToggleMapper>(),
    ),
  );
  getIt.registerFactory(
    () => DisableFeatureToggleUseCase(
      getIt.get<FeatureToggleRepository>(
          instanceName: 'FeatureToggleRepositoryImpl'),
      getIt.get<FeatureToggleMapper>(),
    ),
  );
  getIt.registerFactory(
    () => FetchCapturedPokemonsUseCase(getIt.get<FetchPokedexUseCase>()),
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
