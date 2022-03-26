import 'package:data/data.dart';
import 'package:domain/src/di/domain_locator.dart';
import 'package:get_it/get_it.dart';

void setupDomainModule(final GetIt getIt) {
  setUpDataModule(getIt);
  setupDomainDependencies(getIt);
}
