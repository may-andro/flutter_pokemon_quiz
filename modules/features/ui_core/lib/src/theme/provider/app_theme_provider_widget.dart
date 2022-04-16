import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/src/theme/app_theme.dart';
import 'package:ui_core/src/extension/context_extension.dart';
import 'package:ui_core/src/theme/color/color.dart';

class AppThemeProviderWidget extends StatelessWidget {
  const AppThemeProviderWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme(DarkColorPalette(), LightColorPalette());

    return AnimatedTheme(
      data: context.isDarkMode ? appTheme.darkTheme : appTheme.lightTheme,
      child: Provider<AppTheme>.value(
        value: appTheme,
        child: child,
      ),
    );
  }
}
