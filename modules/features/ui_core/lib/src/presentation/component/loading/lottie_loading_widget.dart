import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_core/assets/assets.gen.dart';

enum LottieAsset { pokemon, pokeball }

class LottieLoadingWidget extends StatelessWidget {
  const LottieLoadingWidget({
    required this.asset,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final LottieAsset asset;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      getLottiePath(),
      package: 'ui_core',
      repeat: true,
    );
  }

  String getLottiePath() {
    switch (asset) {
      case LottieAsset.pokemon:
        return Assets.lottie.pokemon;
      case LottieAsset.pokeball:
        return Assets.lottie.pokeball;
    }
  }
}
