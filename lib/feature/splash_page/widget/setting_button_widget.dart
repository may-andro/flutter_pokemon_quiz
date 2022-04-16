import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmallFABWidget(
      backgroundColor: context.colorPalette.secondary,
      onPressed: () => Navigator.pushNamed(context, SettingRoute.root),
      iconData: Icons.settings,
    );
  }
}
