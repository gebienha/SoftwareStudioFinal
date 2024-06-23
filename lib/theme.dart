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
        iconTheme: IconThemeData(color: Color(0xff0f1512)),
        titleTextStyle: TextStyle(color: Color(0xff0f1512)),
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondary,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(4279921490),
          foregroundColor: Color(4294967295),
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(4294967295),
          fontSize: 16,
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      scaffoldBackgroundColor: Color(4278197010),
      //fontFamily: "Muli",
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0a0f0d),
        foregroundColor: Color(4278197010),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xfff5fbf6)),
        titleTextStyle: TextStyle(color: Color(0xfff5fbf6)),
      ),
      cardTheme: const CardTheme().copyWith(
        color: Color(4290236867),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(4287552187),
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(4278458898),
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
