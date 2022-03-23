import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:pokemon_quiz/di/main_injector.dart';
import 'package:pokemon_quiz/model/build_config.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    required this.buildConfig,
    Key? key,
  }) : super(key: key);

  final BuildConfig buildConfig;

  @override
  Widget build(BuildContext context) {
    final firebaseClient = getIt.get<FirebaseClient>();

    return Scaffold(
      body: FutureBuilder<RemotePokedex>(
          future: firebaseClient.fetchPokedex(buildConfig.buildFlavor.name),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children:
                    snapshot.data!.pokemons.map((e) => Text(e.name)).toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
