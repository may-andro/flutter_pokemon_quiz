import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_pokemon/guess_pokemon.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokemon_detail/pokemon_detail.dart';
import 'package:pokemon_quiz/app/pq_app.dart';
import 'package:pokemon_quiz/di/locator.dart';
import 'package:setting/setting.dart';
import 'package:ui_core/ui_core.dart';

Future<void> runFlavor(final BuildConfig buildConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp();

  await _setupLocator(buildConfig);

  runApp(const PQApp());
}

Future<void> _setupLocator(final BuildConfig buildConfig) async {
  setupAppModule(buildConfig);
  await setupDomainModule(getIt);
  setupUiCoreModule(getIt);
  setupPokedexFeature(getIt);
  setupGuessPokemonFeature(getIt);
  setupPokemonDetailFeature(getIt);
  setupSettingFeature(getIt);
}
