import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/data_source/pokemon_data_source.dart';
import '../data/data_source/pokemon_data_source_impl.dart';
import '../data/mapper/pokemon_model_entity_mapper.dart';
import '../data/repository/pokemon_repository_impl.dart';
import '../data/service/dio/dio_remote_client.dart';
import '../data/service/remote_client.dart';
import '../domain/repository/pokemon_repository.dart';
import '../domain/usecase/fetch_pokedex_usecase.dart';
import '../domain/usecase/fetch_pokemon_usecase.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  _setupRemoteClient();
  _setupDataSource();
  _setupMappers();
  _setupRepository();
  _setupUseCase();
}

void _setupRemoteClient() {
  final dioInstance = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
  dioInstance.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ),
  );

  locator.registerSingleton<Dio>(dioInstance);
  locator.registerSingleton<RemoteClient>(DioRemoteClient(
    locator<Dio>(),
  ));
}

void _setupDataSource() {
  locator.registerSingleton<PokemonDataSource>(PokemonDataSourceImpl(
    locator<RemoteClient>(),
  ));
}

void _setupMappers() {
  locator.registerSingleton<PokemonModelEntityMapper>(
    PokemonModelEntityMapper(),
  );
}

void _setupRepository() {
  locator.registerSingleton<PokemonRepository>(
    PokemonRepositoryImpl(
      locator<PokemonDataSource>(),
      locator<PokemonModelEntityMapper>(),
    ),
  );
}

void _setupUseCase() {
  locator.registerSingleton<FetchPokemonUseCase>(
    FetchPokemonUseCase(
      locator<PokemonRepository>(),
    ),
  );
  locator.registerSingleton<FetchPokedexUseCase>(
    FetchPokedexUseCase(
      locator<FetchPokemonUseCase>(),
    ),
  );
}