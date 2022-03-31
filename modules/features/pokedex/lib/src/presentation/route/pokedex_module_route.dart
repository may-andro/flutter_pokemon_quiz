import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';
import 'package:ui_core/ui_core.dart';

class PokedexModuleRoute extends ModuleRoute {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return <String, MaterialPageRoute>{
      PokedexRoute.root: MaterialPageRoute(
        builder: (_) => const PokedexPage(),
        settings: settings,
      ),
    };
  }
}
