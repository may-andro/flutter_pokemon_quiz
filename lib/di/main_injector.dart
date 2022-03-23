import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:pokemon_quiz/di/main_injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
void configureDependencies() {
  configureNetworkDependencies(getIt);
  $initGetIt(getIt);
}
