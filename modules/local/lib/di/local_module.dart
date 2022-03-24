import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:local/objectbox.g.dart';

@module
abstract class LocalModule {
  @singleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @preResolve
  @singleton
  Future<Store> get store async => openStore();
}
