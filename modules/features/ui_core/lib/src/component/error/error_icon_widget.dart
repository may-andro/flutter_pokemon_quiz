import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_core/assets/assets.gen.dart';

class ErrorIconWidget extends StatelessWidget {
  const ErrorIconWidget({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Assets.lottie.error,
      package: 'ui_core',
      repeat: true,
      height: height,
      width: width,
    );
  }
}
