import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      heroTag: null,
      backgroundColor: context.colorPalette.secondary,
      onPressed: () => Navigator.pushNamed(context, SettingRoute.root),
      child: Icon(
        Icons.settings,
        color: context.colorPalette.grey80,
        size: context.getGridDimen(3),
      ),
    );
  }
}
