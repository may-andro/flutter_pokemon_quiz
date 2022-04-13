import 'package:flutter/material.dart';
import 'package:ui_core/src/theme/color/color_palette.dart';

class DarkColorPalette extends ColorPalette {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primary => const Color(0xFF819595);

  @override
  Color get primaryContainer => const Color(0xFF819595);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get secondary => const Color(0xFF819595);

  @override
  Color get secondaryContainer => const Color(0xFF819595);

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get background => const Color(0xFF241E30);

  @override
  Color get onBackground => const Color(0x0FFFFFFF);

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

  @override
  Color get grey0 => const Color(0xFF000000);

  @override
  Color get grey10 => const Color(0xFF1A1A1A);

  @override
  Color get grey100 => const Color(0xFFFFFFFF);

  @override
  Color get grey20 => const Color(0xFF292929);

  @override
  Color get grey30 => const Color(0xFF3A3A3A);

  @override
  Color get grey40 => const Color(0xFF616161);

  @override
  Color get grey50 => const Color(0xFF8C8C8C);

  @override
  Color get grey60 => const Color(0xFFB3B3B3);

  @override
  Color get grey70 => const Color(0xFFCCCCCC);

  @override
  Color get grey80 => const Color(0xFFE3E3E3);

  @override
  Color get grey90 => const Color(0xFFF9F7F7);
}
