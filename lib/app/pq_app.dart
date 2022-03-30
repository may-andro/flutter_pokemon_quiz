import 'package:flutter/material.dart';
import 'package:pokemon_quiz/feature/route/route_generator.dart';
import 'package:ui_core/ui_core.dart';

class PQApp extends StatelessWidget {
  const PQApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (_, child) {
        return AppThemeProviderWidget(child: child!);
      },
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
