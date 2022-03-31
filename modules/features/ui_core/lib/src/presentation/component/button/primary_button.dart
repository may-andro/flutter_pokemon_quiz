import 'package:flutter/material.dart';
import 'package:ui_core/src/extension/context.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.label,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: double.infinity,
        height: 48,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: context.colorPalette.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          label,
          style: context.textTheme.button,
        ),
      ),
    );
  }
}
