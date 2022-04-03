import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';
import 'package:ui_core/ui_core.dart';
import 'package:avatar_glow/avatar_glow.dart';

class GuessPokemonButtonWidget extends StatelessWidget {
  const GuessPokemonButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowColor: context.colorPalette.grey70,
      endRadius: context.getGridDimen(6),
      child: FloatingActionButton.large(
        elevation: 16,
        heroTag: null,
        tooltip: "Who's that Pokémon",
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
      ),
    );
  }
}
