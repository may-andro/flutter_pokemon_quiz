import 'package:flutter/material.dart';

abstract class ColorPalette {
  Color get primary;
  Color get primaryContainer;
  Color get onPrimary;
  Color get secondary;
  Color get secondaryContainer;
  Color get onSecondary;
  Color get surface;
  Color get onSurface;
  Color get background;
  Color get onBackground;
  Color get error;
  Color get onError;
  Color get hintColor;
  Color get focusColor;
  Color get highlightColor;
  Brightness get brightness;
}
