import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:pokemon_quiz/di/main_injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureDependencies() async {
  configureNetworkDependencies(getIt);
  await configureLocalDependencies(getIt);
  configureDataDependencies(getIt);
  configureDomainDependencies(getIt);
  $initGetIt(getIt);
}
