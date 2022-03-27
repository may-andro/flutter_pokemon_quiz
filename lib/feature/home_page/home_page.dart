import 'package:flutter/material.dart';
import 'package:guess_pokemon/guess_pokemon.dart';
import 'package:pokemon_quiz/app/pq_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PQApp(child: GuessPokemonPage());
  }
}
