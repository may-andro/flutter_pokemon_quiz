import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:ui_core/src/presentation/component/image/pokeball_image_widget.dart';

class AnimatorLoadingWidget extends StatefulWidget {
  const AnimatorLoadingWidget({
    required this.height,
    required this.width,
    this.durationInSec = 3,
    Key? key,
  }) : super(key: key);

  final int durationInSec;
  final double height;
  final double width;

  @override
  State<AnimatorLoadingWidget> createState() => _AnimatorLoadingWidgetState();
}

class _AnimatorLoadingWidgetState extends State<AnimatorLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationInSec),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRotatingImage();
  }

  Widget _buildRotatingImage() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: PokeballImageWidget(
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}
