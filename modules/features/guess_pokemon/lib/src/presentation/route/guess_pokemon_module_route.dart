import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_page.dart';

class GuessPokemonModuleRoute extends ModuleRoute {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return <String, MaterialPageRoute>{
      GuessPokemonRoute.root: MaterialPageRoute(
        builder: (_) => const GuessPokemonPage(),
        settings: settings,
      ),
    };
  }
}
