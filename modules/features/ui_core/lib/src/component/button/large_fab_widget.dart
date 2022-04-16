import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:ui_core/src/extension/extension.dart';

class LargeFABWidget extends StatelessWidget {
  const LargeFABWidget({
    required this.child,
    this.animateGlow = false,
    this.backgroundColor,
    this.toolTipLabel,
    this.heroTag,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool animateGlow;
  final Color? backgroundColor;
  final String? toolTipLabel;
  final String? heroTag;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: animateGlow,
      glowColor: context.colorPalette.grey70,
      endRadius: context.getGridDimen(6),
      child: FloatingActionButton.large(
        elevation: 16,
        tooltip: toolTipLabel,
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        heroTag: heroTag,
        child: child,
      ),
    );
  }
}
