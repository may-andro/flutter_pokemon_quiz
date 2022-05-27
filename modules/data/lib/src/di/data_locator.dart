import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/data_source/feature_toggle/feature_toggle_data_source_impl.dart';
import 'package:data/src/data_source/pokedex/pokedex_data_source_impl.dart';
import 'package:data/src/data_source/pokemon/pokemon_data_source_impl.dart';
import 'package:data/src/mapper/mapper.dart';
import 'package:data/src/repository/feature_toggle/feature_toggle_repository_impl.dart';
import 'package:data/src/repository/pokemon/pokemon_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';

void setupDataDependencies(final GetIt getIt) {
  _setupMappers(getIt);
  _setupDataSources(getIt);
  _setupDataRepositories(getIt);
}

void _setupMappers(final GetIt getIt) {
  getIt.registerFactory(
    ExtendedPokemonRemoteMapper.new,
  );
  getIt.registerFactory(() => PokemonRemoteMapper(getIt.get()));
  getIt.registerFactory(PokemonStatsRemoteMapper.new);
  getIt.registerFactory(FeatureToggleMapper.new);
}

void _setupDataSources(final GetIt getIt) {
  getIt.registerLazySingleton<PokedexDataSource>(
    () => PokedexDataSourceImpl(getIt.get()),
    instanceName: 'PokedexDataSourceImpl',
  );
  getIt.registerLazySingleton<PokemonDataSource>(
    () => PokemonDataSourceImpl(
      getIt.get<LocalClient<LocalPokemon>>(instanceName: 'PokemonLocalClient'),
      getIt.get<RemoteClient>(instanceName: 'DioRemoteClient'),
    ),
    instanceName: 'PokemonDataSourceImpl',
  );
  getIt.registerLazySingleton<FeatureToggleDataSource>(
    () => FeatureToggleDataSourceImpl(getIt.get()),
    instanceName: 'FeatureToggleDataSourceImpl',
  );
}

void _setupDataRepositories(final GetIt getIt) {
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      getIt.get<PokemonDataSource>(instanceName: 'PokemonDataSourceImpl'),
      getIt.get<PokedexDataSource>(instanceName: 'PokedexDataSourceImpl'),
      getIt.get<PokemonRemoteMapper>(),
      getIt.get<ExtendedPokemonRemoteMapper>(),
    ),
    instanceName: 'PokemonRepositoryImpl',
  );
  getIt.registerLazySingleton<FeatureToggleRepository>(
    () => FeatureToggleRepositoryImpl(
      getIt.get<FeatureToggleDataSource>(
        instanceName: 'FeatureToggleDataSourceImpl',
      ),
      getIt.get<FeatureToggleMapper>(),
    ),
    instanceName: 'FeatureToggleRepositoryImpl',
  );
}
