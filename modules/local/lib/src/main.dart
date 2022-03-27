import 'package:get_it/get_it.dart';
import 'package:local/src/di/local_locator.dart';

Future<void> setupLocalModule(final GetIt getIt) async {
  await setupLocalDependencies(getIt);
}
