import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';
import 'package:ui_core/src/extension/context_extension.dart';

class PokeballImageWidget extends StatelessWidget {
  const PokeballImageWidget({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.badgePokemon.path,
      width: width,
      height: height,
      color: context.colorPalette.grey20,
      package: 'ui_core',
    );
  }
}
