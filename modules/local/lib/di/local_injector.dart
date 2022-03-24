import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:local/di/local_injector.config.dart';

@InjectableInit(initializerName: r'$initLocalGetIt')
Future configureLocalDependencies(GetIt getIt) async => $initLocalGetIt(getIt);
