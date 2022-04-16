import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';
import 'package:ui_core/ui_core.dart';

class GuessPokemonButtonWidget extends StatelessWidget {
  const GuessPokemonButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LargeFABWidget(
      animateGlow: true,
      toolTipLabel: "Who's that Pokémon",
      onPressed: () => Navigator.pushNamed(context, GuessPokemonRoute.root),
      backgroundColor: context.colorPalette.primary,
      child: Center(
        child: Image.asset(
          Assets.images.avatarRyhorn.path,
          width: context.getGridDimen(5),
          height: context.getGridDimen(5),
          package: 'ui_core',
          color: context.colorPalette.grey80,
        ),
      ),
    );
  }
}
