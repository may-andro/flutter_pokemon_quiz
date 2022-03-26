import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokemon_quiz/app/pq_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PQApp(child: PokedexPage());
  }
}
