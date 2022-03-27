import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';

class PokemonLogoImageWidget extends StatelessWidget {
  const PokemonLogoImageWidget({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.images.pokemonLogo.path,
        width: width,
        height: height,
        package: 'ui_core',
      ),
    );
  }
}
