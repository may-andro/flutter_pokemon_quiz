import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz/app/pq_app.dart';
import 'package:pokemon_quiz/di/locator.dart';

Future<void> runFlavor(final BuildConfig buildConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  setupAppModule(buildConfig);

  runApp(const PQApp());
}