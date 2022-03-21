import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz/feature/pokemon_quiz_app/pokemon_quiz_app.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_page.dart';
import 'package:pokemon_quiz/model/build_config.dart';

Future<void> runFlavor(final BuildConfig buildConfig) async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final splashPage = SplashPage(
    key: UniqueKey(),
    onInitializationSuccess: () => _runQuizPage(buildConfig),
  );

  runApp(splashPage);
}

void _runQuizPage(BuildConfig buildConfig) {
  final pokemonQuizApp = PokemonQuizApp(buildConfig: buildConfig);

  runApp(pokemonQuizApp);
}
