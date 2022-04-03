import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokedexButtonWidget extends StatelessWidget {
  const PokedexButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      heroTag: null,
      backgroundColor: context.colorPalette.secondary,
      onPressed: () => Navigator.pushNamed(context, PokedexRoute.root),
      child: Icon(
        Icons.catching_pokemon,
        color: context.colorPalette.grey80,
        size: context.getGridDimen(3),
      ),
    );
  }
}
