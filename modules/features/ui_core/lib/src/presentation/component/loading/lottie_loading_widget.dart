import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_core/assets/assets.gen.dart';

enum LottieAsset { pokemon, pokeball }

class LottieLoadingWidget extends StatefulWidget {
  const LottieLoadingWidget({
    required this.asset,
    required this.height,
    required this.width,
    this.onAnimationFinish,
    Key? key,
  }) : super(key: key);

  final LottieAsset asset;
  final double height;
  final double width;
  final VoidCallback? onAnimationFinish;

  @override
  State<LottieLoadingWidget> createState() => _LottieLoadingWidgetState();
}

class _LottieLoadingWidgetState extends State<LottieLoadingWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repeat = widget.onAnimationFinish == null;
    return Center(
      child: Lottie.asset(
        getLottiePath(),
        height: widget.height,
        width: widget.width,
        package: 'ui_core',
        repeat: repeat,
        controller: _animationController,
        onLoaded: (composition) {
          _animationController.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.onAnimationFinish?.call();
            }
          });
          _animationController
            ..duration = composition.duration
            ..forward();
        },
      ),
    );
  }

  String getLottiePath() {
    switch (widget.asset) {
      case LottieAsset.pokemon:
        return Assets.lottie.pokemon;
      case LottieAsset.pokeball:
        return Assets.lottie.pokeball;
    }
  }
}
