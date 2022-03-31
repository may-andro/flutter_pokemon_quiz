import 'package:get_it/get_it.dart';
import 'package:network/src/client/firebase/remote_config_client.dart';
import 'package:network/src/di/network_locator.dart';

Future<void> setUpNetworkModule(final GetIt getIt) async {
  setupNetworkDependencies(getIt);

  await initializeRemoteConfig(getIt);
}

Future<void> initializeRemoteConfig(final GetIt getIt) async {
  final remoteConfigClient = getIt.get<RemoteConfigClient>();
  await remoteConfigClient.initialise();
}
