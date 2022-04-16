import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:domain/domain.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_page.dart';

class PokemonDetailModuleRoute extends ModuleRoute {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    final args = settings.arguments;

    return <String, MaterialPageRoute>{
      PokemonDetailRoute.root: MaterialPageRoute(
        builder: (_) {
          if (args is Pokemon) {
            return PokemonDetailPage(pokemon: args);
          }
          return const ErrorPageWidget();
        },
        settings: settings,
      ),
    };
  }
}
