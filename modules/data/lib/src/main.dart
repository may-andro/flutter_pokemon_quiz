import 'package:data/src/di/data_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';

Future<void> setUpDataModule(final GetIt getIt) async {
  setupDataDependencies(getIt);
  await setupLocalModule(getIt);
  await setUpNetworkModule(getIt);
}
