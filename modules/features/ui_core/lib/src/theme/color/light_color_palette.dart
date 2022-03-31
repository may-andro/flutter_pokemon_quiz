import 'package:flutter/material.dart';
import 'package:ui_core/src/theme/color/color_palette.dart';

class LightColorPalette extends ColorPalette {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primary => const Color(0xFFF4F4F4);

  @override
  Color get primaryContainer => const Color(0xFFF4F4F4);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get secondary => const Color(0xFFF4F4F4);

  @override
  Color get secondaryContainer => const Color(0xFFF4F4F4);

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

  @override
  Color get grey0 => const Color(0xFFFFFFFF);

  @override
  Color get grey10 => const Color(0xFFF4F4F4);

  @override
  Color get grey100 => const Color(0xFF000000);

  @override
  Color get grey20 => const Color(0xFFCCCCCC);

  @override
  Color get grey30 => const Color(0xFF999999);

  @override
  Color get grey40 => const Color(0xFF4D4D4D);

  @override
  Color get grey50 => const Color(0xFF333333);

  @override
  Color get grey60 => const Color(0xFF292929);

  @override
  Color get grey70 => const Color(0xFF1A1A1A);

  @override
  Color get grey80 => const Color(0xFF111112);

  @override
  Color get grey90 => const Color(0xFF0E0E0E);
}
