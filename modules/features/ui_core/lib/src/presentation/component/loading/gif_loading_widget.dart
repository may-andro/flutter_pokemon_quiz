import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';

class GIFLoadingWidget extends StatelessWidget {
  const GIFLoadingWidget({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.gif.pokemon.path,
      height: height,
      width: width,
      package: 'ui_core',
    );
  }
}
