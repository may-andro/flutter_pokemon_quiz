import 'package:domain/di/domain_injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: r'$initDomainGetIt')
void configureDomainDependencies(GetIt getIt) => $initDomainGetIt(getIt);
