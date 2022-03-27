import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_quiz/app/pq_app.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    required this.onInitializationSuccess,
    Key? key,
  }) : super(key: key);

  final VoidCallback onInitializationSuccess;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      widget.onInitializationSuccess();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const PQApp(
      child: Scaffold(
        body: SplashWidget(),
      ),
    );
  }
}
