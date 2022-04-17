import 'package:flutter/material.dart';
import 'package:ui_core/src/extension/extension.dart';

class SmallFABWidget extends StatelessWidget {
  const SmallFABWidget({
    required this.iconData,
    this.backgroundColor,
    this.toolTipLabel,
    this.heroTag,
    this.onPressed,
    this.elevation,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final Color? backgroundColor;
  final String? toolTipLabel;
  final String? heroTag;
  final VoidCallback? onPressed;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      elevation: elevation,
      heroTag: heroTag,
      tooltip: toolTipLabel,
      backgroundColor: backgroundColor,
      child: Icon(
        iconData,
        size: context.getGridDimen(3),
      ),
    );
  }
}
