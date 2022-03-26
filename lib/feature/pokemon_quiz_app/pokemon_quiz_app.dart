import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';
import 'package:ui_core/ui_core.dart';

class PokemonQuizApp extends StatelessWidget {
  const PokemonQuizApp({
    required this.buildConfig,
    Key? key,
  }) : super(key: key);

  final BuildConfig buildConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokedexPage(),
    );
  }
}
