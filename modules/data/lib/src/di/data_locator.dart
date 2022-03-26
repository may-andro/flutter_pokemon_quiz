import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/repository/pokedex/pokedex_repository.dart';
import 'package:data/src/repository/pokedex/pokedex_repository_impl.dart';
import 'package:data/src/repository/pokemon/pokemon_repository.dart';
import 'package:data/src/repository/pokemon/pokemon_repository_impl.dart';
import 'package:get_it/get_it.dart';

void setupDataDependencies(final GetIt getIt) {
  _setupDataSources(getIt);
  _setupDataRepositories(getIt);
}

void _setupDataSources(final GetIt getIt) {
  getIt.registerLazySingleton<PokedexDataSource>(
      () => PokedexDataSourceImpl(getIt.get()),
      instanceName: 'PokedexDataSourceImpl');
  getIt.registerLazySingleton<PokemonDataSource>(
      () => PokemonDataSourceImpl(getIt.get()),
      instanceName: 'PokemonDataSourceImpl');
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
}