import 'package:firstapp/src/approot.dart';
import 'package:flutter/material.dart';

class HouseAppTheme {
  static TextTheme _buildTextTheme(TextTheme base, String fontFamily) {
    return base.copyWith(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: fontFamily,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontFamily: fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontFamily: fontFamily,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontFamily: fontFamily,
      ),
    );
  }

  static ThemeData buildLightTheme() {
    final Color primaryColor = HexColor('#446faf');
    final Color secondaryColor = HexColor('#446faf');
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme, 'WorkSans'),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme, 'WorkSans'),
      platform: TargetPlatform.iOS,
      colorScheme: colorScheme
          .copyWith(background: const Color(0xFFFFFFFF))
          .copyWith(error: const Color(0xFFB00020)),
    );
  }
}
