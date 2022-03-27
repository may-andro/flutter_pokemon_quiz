import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.getGridDimen(1)),
        PokemonLogoImageWidget(
          height: context.height * 0.25,
          width: context.width * 0.7,
        ),
        SizedBox(height: context.getGridDimen(3)),
        LottieLoadingWidget(
          height: context.height * 0.3,
          width: context.height * 0.3,
          asset: LottieAsset.pokemon,
        ),
        const Spacer(),
        Text(
          'Loading pokemons ...',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorPalette.grey80,
          ),
        ),
        const LinearProgressIndicator(),
        SizedBox(height: context.getGridDimen(3)),
      ],
    );
  }
}
