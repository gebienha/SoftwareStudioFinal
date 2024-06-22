import 'package:flutter/material.dart';
import 'constants.dart'; // Import your constants file or define constants inline.

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xa6f2d2),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color(0x1a6b52),
);



class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: Colors.white,
      //fontFamily: "Muli",
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        //foregroundColor: kColorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondary,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kColorScheme.onSecondary,
          fontSize: 16,
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      //fontFamily: "Muli",
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondary,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primary,
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kDarkColorScheme.onSecondary,
          fontSize: 16,
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(28)),
  borderSide: BorderSide(color: kTextColor),
  gapPadding: 10,
);
