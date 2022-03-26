import 'package:flutter/material.dart';
import 'package:ui_core/src/theme/color/color_palette.dart';

class DarkColorPalette extends ColorPalette {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primary => const Color(0xFF213333);

  @override
  Color get primaryContainer => const Color(0xFF213333);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get secondary => const Color(0xFF313A44);

  @override
  Color get secondaryContainer => const Color(0xFF313A44);

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get background => const Color(0xFF241E30);

  @override
  Color get onBackground => const Color(0x0DFFFFFF);

  @override
  Color get error => Colors.orange;

  @override
  Color get onError => Colors.white;

  @override
  Color get onSurface => Colors.white;

  @override
  Color get surface => const Color(0xFF1F1929);

  @override
  Color get focusColor => Colors.white.withOpacity(0.12);

  @override
  Color get hintColor => const Color(0xFF999999);

  @override
  Color get highlightColor => Colors.transparent;
}
