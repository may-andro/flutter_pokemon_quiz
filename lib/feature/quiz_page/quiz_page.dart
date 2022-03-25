import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz/di/main_injector.dart';
import 'package:pokemon_quiz/model/build_config.dart';

class QuizPageState {
  QuizPageState([this.error, this.pokedex]);

  Error? error;
  Pokedex? pokedex;
}

class QuizPage extends StatelessWidget {
  const QuizPage({
    required this.buildConfig,
    Key? key,
  }) : super(key: key);

  final BuildConfig buildConfig;

  Stream<QuizPageState> _eitherLoadedOrErrorState() async* {
    final _fetchPokedexUseCase = getIt.get<FetchPokedexUseCase>();
    final pokedex =
        await _fetchPokedexUseCase.call(buildConfig.buildFlavor.name);

    yield pokedex.fold(
      (failure) => QuizPageState(Error()),
      (success) => QuizPageState(null, success),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuizPageState>(
          stream: _eitherLoadedOrErrorState(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.pokedex!.pokemons
                    .map((e) => Card(
                            child: Center(
                                child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.name),
                        ))))
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
