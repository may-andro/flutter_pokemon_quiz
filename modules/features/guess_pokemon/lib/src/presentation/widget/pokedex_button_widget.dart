import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokedexButtonWidget extends StatelessWidget {
  const PokedexButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, ROUTE_POKEDEX);
      },
      child: const Icon(Icons.catching_pokemon),
    );
  }
}
