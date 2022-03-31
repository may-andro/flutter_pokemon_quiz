import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({
    required this.isInitialized,
    Key? key,
  }) : super(key: key);

  final bool isInitialized;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      backgroundColor: isInitialized
          ? context.colorPalette.secondary
          : context.colorPalette.grey10,
      onPressed: isInitialized
          ? () => Navigator.pushNamed(context, SettingRoute.root)
          : null,
      child: Icon(Icons.settings, color: context.colorPalette.grey80),
    );
  }
}
