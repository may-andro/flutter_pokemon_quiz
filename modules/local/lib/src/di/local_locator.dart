import 'package:get_it/get_it.dart';
import 'package:local/objectbox.g.dart';
import 'package:local/src/client/clients.dart';

Future<void> setupLocalDependencies(final GetIt getIt) async {
  await _injectObjectBoxStore(getIt);
  _injectLocalClients(getIt);
}

Future<void> _injectObjectBoxStore(final GetIt getIt) async {
  final store = await openStore();
  getIt.registerLazySingleton<Store>(() => store);
}

void _injectLocalClients(final GetIt getIt) {
  getIt.registerLazySingleton<PokemonLocalClient>(
    () => PokemonLocalClient(getIt.get<Store>()),
    instanceName: 'PokemonLocalClient',
  );
}
