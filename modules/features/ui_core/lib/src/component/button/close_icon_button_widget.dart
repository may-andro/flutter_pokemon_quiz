import 'package:flutter/material.dart';
import 'package:ui_core/src/extension/extension.dart';

class CloseIconButtonWidget extends StatelessWidget {
  const CloseIconButtonWidget({
    required this.iconSizeFactor,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  final double iconSizeFactor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: context.getGridDimen(iconSizeFactor),
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.close, color: iconColor ?? context.colorPalette.grey80),
    );
  }
}
