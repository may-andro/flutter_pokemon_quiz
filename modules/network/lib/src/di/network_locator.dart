import 'package:get_it/get_it.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:network/src/client/firebase_client.dart';

void setupNetworkDependencies(final GetIt getIt) {
  _injectFirebaseDependencies(getIt);
  _injectRemoteClients(getIt);
}

void _injectFirebaseDependencies(final GetIt getIt) {
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}

void _injectRemoteClients(final GetIt getIt) {
  getIt.registerLazySingleton(
    () => FirebaseClient(getIt.get<FirebaseFirestore>()),
  );
}
