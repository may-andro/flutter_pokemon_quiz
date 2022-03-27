import 'package:data/data.dart';
import 'package:domain/src/di/domain_locator.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDomainModule(final GetIt getIt) async {
  await setUpDataModule(getIt);
  setupDomainDependencies(getIt);
}
