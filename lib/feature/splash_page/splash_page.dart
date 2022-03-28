import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_quiz/app/pq_app.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    required this.onInitializationSuccess,
    Key? key,
  }) : super(key: key);

  final VoidCallback onInitializationSuccess;

  @override
  Widget build(BuildContext context) {
    return PQApp(
      child: Scaffold(
        body: SplashWidget(initializationCompleted: onInitializationSuccess),
      ),
    );
  }
}
