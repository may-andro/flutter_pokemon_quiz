import 'package:flutter/material.dart';
import 'package:guess_pokemon/guess_pokemon.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokemon_detail/pokemon_detail.dart';
import 'package:pokemon_quiz/route/main_module_route.dart';
import 'package:setting/setting.dart';
import 'package:ui_core/ui_core.dart';

class PQApp extends StatelessWidget {
  const PQApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Quiz',
      builder: (_, child) {
        return AppThemeProviderWidget(child: child!);
      },
      initialRoute: '/',
      onGenerateRoute: _generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings routeSettings) {
    final routesMap = <String, MaterialPageRoute>{};
    routesMap.addAll(MainModuleRoute().getRoutes(routeSettings));
    routesMap.addAll(PokedexModuleRoute().getRoutes(routeSettings));
    routesMap.addAll(GuessPokemonModuleRoute().getRoutes(routeSettings));
    routesMap.addAll(PokemonDetailModuleRoute().getRoutes(routeSettings));
    routesMap.addAll(SettingModuleRoute().getRoutes(routeSettings));
    return routesMap[routeSettings.name];
  }
}
