import 'package:flutter/material.dart';
import 'package:pokemon_quiz/model/build_config.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    Key? key,
    required this.buildConfig,
  }) : super(key: key);

  final BuildConfig buildConfig;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('APP: ${buildConfig.buildFlavor}'),
      ),
    );
  }
}
