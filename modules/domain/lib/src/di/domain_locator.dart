import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/feature_toggle/disable_feature_toggle_use_case.dart';
import 'package:domain/src/usecase/feature_toggle/enable_feature_toggle_use_case.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:get_it/get_it.dart';

void setupDomainDependencies(final GetIt getIt) {
  _setupMappers(getIt);
  _setUpUseCases(getIt);
}

void _setupMappers(final GetIt getIt) {
  getIt.registerFactory(() => PokedexRemoteMapper(getIt.get()));
  getIt.registerFactory(ExtendedPokemonRemoteMapper.new);
  getIt.registerFactory(FavouritePokemonLocalMapper.new);
  getIt.registerFactory(PokemonLocalMapper.new);
  getIt.registerFactory(() => PokemonRemoteMapper(getIt.get()));
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
    () => AddFavouritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
      getIt.get<PokemonLocalMapper>(),
    ),
  );
  getIt.registerFactory(
    () => FetchFavouritePokemonsUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
      getIt.get<FavouritePokemonLocalMapper>(),
    ),
  );
  getIt.registerFactory(
    () => RemoveFavouritePokemonUseCase(
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
        instanceName: 'FeatureToggleRepositoryImpl',
      ),
      getIt.get<FeatureToggleMapper>(),
    ),
  );
}
