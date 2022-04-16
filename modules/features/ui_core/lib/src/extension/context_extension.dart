import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/src/component/component.dart';
import 'package:ui_core/src/theme/app_theme.dart';
import 'package:ui_core/src/theme/color/color.dart';

extension BuildContextExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Size get size => MediaQuery.of(this).size;

  double get width => size.width;

  double get height => size.height;

  double get shortestSide => size.shortestSide;

  double get textScaleFactor => MediaQuery.textScaleFactorOf(this);

  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;

  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;

  Brightness get brightness => MediaQuery.of(this).platformBrightness;

  bool get isLightMode => brightness == Brightness.light;

  bool get isDarkMode => brightness == Brightness.dark;

  DeviceResolution get deviceResolution {
    switch (getWindowType(this)) {
      case AdaptiveWindowType.xsmall:
        return DeviceResolution.mobile;
      case AdaptiveWindowType.small:
        return DeviceResolution.tablet;
      case AdaptiveWindowType.medium:
        return DeviceResolution.desktop;
      case AdaptiveWindowType.large:
        return DeviceResolution.desktop;
      case AdaptiveWindowType.xlarge:
        return DeviceResolution.desktop;
      default:
        return DeviceResolution.mobile;
    }
  }

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppTheme get appTheme => watch<AppTheme>();

  ColorPalette get colorPalette => appTheme.getColorPalette(this);

  double getGridDimen(double factor) => appTheme.getGridDimen(this, factor);
}
