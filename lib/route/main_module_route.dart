import 'package:flutter/material.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_page.dart';
import 'package:ui_core/ui_core.dart';

class MainModuleRoute extends ModuleRoute {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return <String, MaterialPageRoute>{
      MainRoute.root: MaterialPageRoute(
        builder: (_) => const SplashPage(),
        settings: settings,
      ),
    };
  }
}
