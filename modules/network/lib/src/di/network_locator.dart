import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:network/src/client/client.dart';
import 'package:network/src/client/dio/dio_remote_client.dart';

void setupNetworkDependencies(final GetIt getIt) {
  _injectFirebaseDependencies(getIt);
  _setupDioClient(getIt);
  _injectRemoteClients(getIt);
}

void _injectFirebaseDependencies(final GetIt getIt) {
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseRemoteConfig.instance);
}

void _setupDioClient(final GetIt getIt) {
  final dioInstance = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
  getIt.registerSingleton<Dio>(dioInstance);
}

void _injectRemoteClients(final GetIt getIt) {
  getIt.registerLazySingleton(
    () => FireStoreClient(getIt.get<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton(
    () => RemoteConfigClient(getIt.get<FirebaseRemoteConfig>()),
  );
  getIt.registerSingleton<RemoteClient>(
    DioRemoteClient(getIt<Dio>()),
    instanceName: 'DioRemoteClient',
  );
}
