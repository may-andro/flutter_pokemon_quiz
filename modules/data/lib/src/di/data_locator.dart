import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/data_source/feature_toggle/feature_toggle_data_source_impl.dart';
import 'package:data/src/data_source/pokedex/pokedex_data_source_impl.dart';
import 'package:data/src/data_source/pokemon/pokemon_data_source_impl.dart';
import 'package:data/src/repository/repository.dart';
import 'package:data/src/repository/feature_toggle/feature_toggle_repository_impl.dart';
import 'package:data/src/repository/pokedex/pokedex_repository_impl.dart';
import 'package:data/src/repository/pokemon/pokemon_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';

void setupDataDependencies(final GetIt getIt) {
  _setupDataSources(getIt);
  _setupDataRepositories(getIt);
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
  getIt.registerLazySingleton<PokedexRepository>(
    () => PokedexRepositoryImpl(
      getIt.get<PokedexDataSource>(instanceName: 'PokedexDataSourceImpl'),
    ),
    instanceName: 'PokedexRepositoryImpl',
  );
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      getIt.get<PokemonDataSource>(instanceName: 'PokemonDataSourceImpl'),
    ),
    instanceName: 'PokemonRepositoryImpl',
  );
  getIt.registerLazySingleton<FeatureToggleRepository>(
    () => FeatureToggleRepositoryImpl(
      getIt.get<FeatureToggleDataSource>(
        instanceName: 'FeatureToggleDataSourceImpl',
      ),
    ),
    instanceName: 'FeatureToggleRepositoryImpl',
  );
}
