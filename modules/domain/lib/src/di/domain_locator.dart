import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:get_it/get_it.dart';

void setupDomainDependencies(final GetIt getIt) {
  _setupMappers(getIt);
  _setUpUseCases(getIt);
}

void _setupMappers(final GetIt getIt) {
  getIt.registerLazySingleton(FavouritePokemonLocalMapper.new);
  getIt.registerLazySingleton(PokemonLocalMapper.new);
  getIt.registerLazySingleton(() => PokemonRemoteMapper(getIt.get()));
  getIt.registerLazySingleton(PokemonStatsRemoteMapper.new);
  getIt.registerLazySingleton(() => PokedexRemoteMapper(getIt.get()));
}

void _setUpUseCases(final GetIt getIt) {
  getIt.registerLazySingleton(
    () => FetchPokedexUseCase(
      getIt.get<PokedexRepository>(instanceName: 'PokedexRepositoryImpl'),
      getIt.get<PokedexRemoteMapper>(),
    ),
  );
  getIt.registerLazySingleton(
    () => AddFavouritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
      getIt.get<PokemonLocalMapper>(),
    ),
  );
  getIt.registerLazySingleton(
    () => FetchFavouritePokemonsUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
      getIt.get<FavouritePokemonLocalMapper>(),
    ),
  );
  getIt.registerLazySingleton(
    () => RemoveFavouritePokemonUseCase(
      getIt.get<PokemonRepository>(instanceName: 'PokemonRepositoryImpl'),
    ),
  );
}
