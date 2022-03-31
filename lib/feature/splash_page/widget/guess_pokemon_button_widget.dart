import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';
import 'package:ui_core/ui_core.dart';
import 'package:avatar_glow/avatar_glow.dart';

class GuessPokemonButtonWidget extends StatelessWidget {
  const GuessPokemonButtonWidget({
    required this.isInitialized,
    Key? key,
  }) : super(key: key);

  final bool isInitialized;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowColor: context.colorPalette.grey70,
      endRadius: 75.0,
      child: FloatingActionButton.large(
        elevation: 16,
        tooltip: "Who's that Pokémon",
        onPressed: isInitialized
            ? () => Navigator.pushNamed(context, GuessPokemonRoute.root)
            : null,
        backgroundColor: context.colorPalette.primary,
        child: Center(
          child: isInitialized
              ? Image.asset(
                  Assets.images.avatarRyhorn.path,
                  width: context.getGridDimen(6),
                  height: context.getGridDimen(6),
                  package: 'ui_core',
                  color: context.colorPalette.grey80,
                )
              : AnimatorLoadingWidget(
                  width: context.getGridDimen(6),
                  height: context.getGridDimen(6),
                ),
        ),
      ),
    );
  }
}
