import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ui_core/src/component/component.dart';
import 'package:ui_core/src/theme/color/color.dart';
import 'package:ui_core/src/extension/context_extension.dart';

const _fontRegular = FontWeight.w400;
const _fontMedium = FontWeight.w500;
const _fontSemiBold = FontWeight.w600;
const _fontBold = FontWeight.w700;

class AppTheme {
  AppTheme(this._darkColorPalette, this._lightColorPalette);

  final ColorPalette _darkColorPalette;
  final ColorPalette _lightColorPalette;

  ThemeData get lightTheme => _getThemeData(_lightColorPalette);

  ThemeData get darkTheme => _getThemeData(_darkColorPalette);

  ThemeData _getThemeData(ColorPalette colorPalette) {
    final colorScheme = _getColorScheme(colorPalette);
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: colorPalette.highlightColor,
      focusColor: colorPalette.focusColor,
      hintColor: colorPalette.hintColor,
    );
  }

  ColorScheme _getColorScheme(ColorPalette colorPalette) {
    return ColorScheme(
      primary: colorPalette.primary,
      onPrimary: colorPalette.onPrimary,
      primaryContainer: colorPalette.primaryContainer,
      secondary: colorPalette.secondary,
      onSecondary: colorPalette.onSecondary,
      secondaryContainer: colorPalette.secondaryContainer,
      background: colorPalette.background,
      onBackground: colorPalette.onBackground,
      surface: colorPalette.surface,
      onSurface: colorPalette.onSurface,
      error: colorPalette.error,
      onError: colorPalette.onError,
      brightness: colorPalette.brightness,
    );
  }

  final _textTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontWeight: _fontBold,
      fontSize: 28.0,
    ),
    headline2: GoogleFonts.montserrat(
      fontWeight: _fontBold,
      fontSize: 24.0,
    ),
    headline3: GoogleFonts.montserrat(
      fontWeight: _fontBold,
      fontSize: 22.0,
    ),
    headline4: GoogleFonts.montserrat(
      fontWeight: _fontBold,
      fontSize: 20.0,
    ),
    headline5: GoogleFonts.oswald(
      fontWeight: _fontMedium,
      fontSize: 16.0,
    ),
    headline6: GoogleFonts.montserrat(
      fontWeight: _fontBold,
      fontSize: 16.0,
    ),
    caption: GoogleFonts.oswald(
      fontWeight: _fontSemiBold,
      fontSize: 16.0,
    ),
    overline: GoogleFonts.montserrat(
      fontWeight: _fontMedium,
      fontSize: 12.0,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontWeight: _fontMedium,
      fontSize: 16.0,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontWeight: _fontMedium,
      fontSize: 14.0,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontWeight: _fontRegular,
      fontSize: 14.0,
    ),
    bodyText2: GoogleFonts.montserrat(
      fontWeight: _fontRegular,
      fontSize: 16.0,
    ),
    button: GoogleFonts.montserrat(
      fontWeight: _fontSemiBold,
      fontSize: 16.0,
    ),
  );

  ColorPalette getColorPalette(BuildContext context) {
    if (context.isDarkMode) {
      return _darkColorPalette;
    }
    return _lightColorPalette;
  }

  double getGridDimen(BuildContext context, double dimen) {
    var grid = 8;
    switch (context.deviceResolution) {
      case DeviceResolution.mobile:
        grid = 8;
        break;
      case DeviceResolution.tablet:
        grid = 12;
        break;
      case DeviceResolution.desktop:
        grid = 16;
        break;
    }
    return grid * dimen;
  }
}
