import 'package:injectable/injectable.dart';
import 'package:local/objectbox.g.dart';

@module
abstract class LocalModule {
  @preResolve
  @singleton
  Future<Store> get store async => openStore();
}
