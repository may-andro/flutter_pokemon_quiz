import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_builder/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/data/data_source/pokemon_data_source_impl.dart';
import 'package:pokedex_builder/data/mapper/pokemon_model_entity_mapper.dart';
import 'package:pokedex_builder/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_builder/data/service/dio/dio_remote_client.dart';
import 'package:pokedex_builder/data/service/remote_client.dart';
import 'package:pokedex_builder/domain/repository/pokemon_repository.dart';
import 'package:pokedex_builder/domain/usecase/fetch_pokedex_end_index_usecase.dart';
import 'package:pokedex_builder/domain/usecase/fetch_pokedex_start_index_usecase.dart';
import 'package:pokedex_builder/domain/usecase/fetch_pokedex_usecase.dart';
import 'package:pokedex_builder/domain/usecase/fetch_pokemon_usecase.dart';
import 'package:pokedex_builder/logger/tool_logger.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  _setupLogger();
  _setupRemoteClient();
  _setupDataSource();
  _setupMappers();
  _setupRepository();
  _setupUseCase();
}

void _setupLogger() {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );
  locator.registerSingleton<Logger>(logger);

  locator.registerSingleton<ToolLogger>(ToolLogger(locator<Logger>()));
}

void _setupRemoteClient() {
  final dioInstance = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
  locator.registerSingleton<Dio>(dioInstance);
  locator.registerSingleton<RemoteClient>(DioRemoteClient(locator<Dio>()));
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
      locator<ToolLogger>(),
    ),
  );
}

void _setupUseCase() {
  locator.registerSingleton<FetchPokemonUseCase>(
    FetchPokemonUseCase(
      locator<PokemonRepository>(),
    ),
  );
  locator.registerSingleton<FetchPokedexStartIndexUseCase>(
    const FetchPokedexStartIndexUseCase(),
  );
  locator.registerSingleton<FetchPokedexEndIndexUseCase>(
    const FetchPokedexEndIndexUseCase(),
  );
  locator.registerSingleton<FetchPokedexUseCase>(
    FetchPokedexUseCase(
      locator<FetchPokemonUseCase>(),
      locator<FetchPokedexStartIndexUseCase>(),
      locator<FetchPokedexEndIndexUseCase>(),
      locator<ToolLogger>(),
    ),
  );
}
