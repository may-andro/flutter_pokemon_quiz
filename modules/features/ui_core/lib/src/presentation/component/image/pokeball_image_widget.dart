import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';

class PokeballImageWidget extends StatelessWidget {
  const PokeballImageWidget({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.badgePokemon.path,
      width: width,
      height: height,
      package: 'ui_core',
    );
  }
}
