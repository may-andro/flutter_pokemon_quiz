import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon_quiz/di/locator.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_core/assets/assets.gen.dart';

class SplashImageWidget extends StatelessWidget {
  const SplashImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.shortestSide * 0.1),
      child: Center(
        child: Lottie.asset(
          _getLottiePath(),
          package: 'ui_core',
          repeat: true,
        ),
      ),
    );
  }

  String _getLottiePath() {
    final buildConfig = getIt.get<BuildConfig>();
    switch (buildConfig.buildFlavor) {
      case BuildFlavor.jhoto:
        return Assets.lottie.jhoto;
      case BuildFlavor.kanto:
        return Assets.lottie.pokemon;
    }
  }
}
