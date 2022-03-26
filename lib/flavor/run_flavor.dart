import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz/di/locator.dart';
import 'package:pokemon_quiz/feature/home_page/home_page.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_page.dart';
import 'package:pokedex/pokedex.dart';
import 'package:ui_core/ui_core.dart';

Future<void> runFlavor(final BuildConfig buildConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await setupLocator(buildConfig);

  final splashPage = SplashPage(
    key: UniqueKey(),
    onInitializationSuccess: _runQuizPage,
  );

  runApp(splashPage);
}

Future<void> setupLocator(final BuildConfig buildConfig) async {
  setupAppModule(buildConfig);
  setupDomainModule(getIt);
  setupUiCoreModule(getIt);
  setupPokedexFeature(getIt);
}

void _runQuizPage() {
  final pokemonQuizApp = HomePage(
    key: UniqueKey(),
  );
  runApp(pokemonQuizApp);
}
