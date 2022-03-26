import 'package:get_it/get_it.dart';
import 'package:local/objectbox.g.dart';
import 'package:local/src/client/clients.dart';

void setupLocalDependencies(final GetIt getIt) {
  _injectObjectBoxStore(getIt);
  _injectLocalClients(getIt);
}

void _injectObjectBoxStore(final GetIt getIt) {
  getIt.registerLazySingleton(openStore);
}

void _injectLocalClients(final GetIt getIt) {
  getIt.registerLazySingleton<LocalClient>(
    () => PokemonLocalClient(getIt.get<Store>()),
    instanceName: 'PokemonLocalClient',
  );
}
