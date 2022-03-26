import 'package:flutter/material.dart';
import 'package:ui_core/src/theme/color/color_palette.dart';

class LightColorPalette extends ColorPalette {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primary => const Color(0xFFFCFCFF);

  @override
  Color get primaryContainer => const Color(0xFF117378);

  @override
  Color get onPrimary => const Color(0xFF1A1A1A);

  @override
  Color get secondary => const Color(0xFFEFF3F3);

  @override
  Color get secondaryContainer => const Color(0xFF322942);

  @override
  Color get onSecondary => const Color(0xFF1A1A1A);

  @override
  Color get background => const Color(0xFFFCFCFF);

  @override
  Color get onBackground => Colors.black;

  @override
  Color get error => Colors.red;

  @override
  Color get onError => Colors.white;

  @override
  Color get surface => const Color(0xFFFAFBFB);

  @override
  Color get onSurface => const Color(0xFF1A1A1A);

  @override
  Color get focusColor => Colors.black.withOpacity(0.12);

  @override
  Color get hintColor => const Color(0xFF999999);

  @override
  Color get highlightColor => Colors.transparent;
}
