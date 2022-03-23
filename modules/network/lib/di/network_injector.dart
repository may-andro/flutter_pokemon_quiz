import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/di/network_injector.config.dart';

@InjectableInit(initializerName: r'$initNetworkGetIt')
void configureNetworkDependencies(GetIt getIt) => $initNetworkGetIt(getIt);
