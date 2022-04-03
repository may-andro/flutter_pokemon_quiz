import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';
import 'package:ui_core/ui_core.dart';

class PokemonLogoImageWidget extends StatelessWidget {
  const PokemonLogoImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.shortestSide * 0.1),
        child: Image.asset(
          Assets.images.logo.path,
          package: 'ui_core',
        ),
      ),
    );
  }
}
