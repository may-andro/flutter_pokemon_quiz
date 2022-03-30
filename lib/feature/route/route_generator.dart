import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:guess_pokemon/guess_pokemon.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokemon_detail/pokemon_detail.dart';
import 'package:pokemon_quiz/feature/home_page/home_page.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_page.dart';
import 'package:ui_core/ui_core.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case ROUTE_POKEDEX:
        return MaterialPageRoute(builder: (_) => const PokedexPage());
      case ROUTE_GUESS_POKEMON:
        return MaterialPageRoute(builder: (_) => const GuessPokemonPage());
      case ROUTE_POKEMON_DETAIL:
        if (args is Pokemon) {
          return MaterialPageRoute(
            builder: (_) => PokemonDetailPage(pokemon: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
