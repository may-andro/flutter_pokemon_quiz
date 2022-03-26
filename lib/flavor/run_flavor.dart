import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz/di/locator.dart';
import 'package:pokemon_quiz/feature/pokemon_quiz_app/pokemon_quiz_app.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_page.dart';
import 'package:pokedex/pokedex.dart';
import 'package:ui_core/ui_core.dart';

Future<void> runFlavor(final BuildConfig buildConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await setupLocator(buildConfig);

  final splashPage = SplashPage(
    key: UniqueKey(),
    onInitializationSuccess: () => _runQuizPage(buildConfig),
  );

  runApp(splashPage);
}

Future<void> setupLocator(final BuildConfig buildConfig) async {
  setupAppModule(buildConfig);
  setupDomainModule(getIt);
  setupUiCoreModule(getIt);
  setupFeaturePokedexDependencies(getIt);
}

void _runQuizPage(BuildConfig buildConfig) {
  final pokemonQuizApp = PokemonQuizApp(buildConfig: buildConfig);

  runApp(pokemonQuizApp);
}
