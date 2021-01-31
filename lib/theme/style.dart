import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double borderRadius = 20.0;

double _offset = 0;
double get offset => _offset;
set offset(double offset) {
  _offset = offset;
}

ThemeData appTheme({double fontOffset = 0}) {
  offset = fontOffset;
  return ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primarySwatch: generateMaterialColor(colorPrimary),
    accentColor: colorAccent,
    // scaffoldBackgroundColor: kColorBackground,
    scaffoldBackgroundColor: colorBackground,

    // Define the default font family.
    fontFamily: 'ArialRounded',

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      textTheme: ButtonTextTheme.primary,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorAccent,
      foregroundColor: colorWhite,
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: colorPrimary),
      color: colorBackground,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 25.0 + fontOffset,
          fontWeight: FontWeight.bold,
          color: colorSecondary,
        ),
      ),
    ),

    tabBarTheme: TabBarTheme(
      labelColor: colorPrimary,
      unselectedLabelColor: colorSecondaryText,
      labelPadding: EdgeInsets.only(bottom: 8.0),
    ),

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 72.0 + fontOffset,
        fontWeight: FontWeight.bold,
        color: colorSecondary,
      ),
      headline5: TextStyle(
        fontSize: 24.0 + fontOffset,
        fontWeight: FontWeight.bold,
        color: colorSecondary,
      ),
      headline6: TextStyle(
        fontSize: 20.0 + fontOffset,
        color: colorSecondary,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0 + fontOffset,
        color: colorSecondaryText,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0 + fontOffset,
        color: colorSecondaryText,
      ),
    ),
  );
}
