import 'package:data/di/data_injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: r'$initDataGetIt')
void configureDataDependencies(GetIt getIt) => $initDataGetIt(getIt);
