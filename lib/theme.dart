// import 'package:flutter/material.dart';
// import 'constants.dart'; // Import your constants file or define constants inline.

// var kColorScheme = ColorScheme.fromSeed(
//   seedColor: Color(0xa6f2d2),
// );

// var kDarkColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: Color(0x1a6b52),
// );



// class AppTheme {
//   static ThemeData lightTheme(BuildContext context) {
//     return ThemeData().copyWith(
//       useMaterial3: true,
//       colorScheme: kColorScheme,
//       scaffoldBackgroundColor: Colors.white,
//       //fontFamily: "Muli",
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.white,
//         //foregroundColor: kColorScheme.primary,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Color(0xff0f1512)),
//         titleTextStyle: TextStyle(color: Color(0xff0f1512)),
//       ),
//       cardTheme: const CardTheme().copyWith(
//         color: kColorScheme.secondary,
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(4279921490),
//           foregroundColor: Color(4294967295),
//           minimumSize: Size(double.infinity, 48),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//       textTheme: ThemeData().textTheme.copyWith(
//         titleLarge: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Color(4294967295),
//           fontSize: 16,
//         ),
//       ),
//     );
//   }

//   static ThemeData darkTheme(BuildContext context) {
//     return ThemeData.dark().copyWith(
//       useMaterial3: true,
//       colorScheme: kDarkColorScheme,
//       scaffoldBackgroundColor: Color(4278197010),
//       //fontFamily: "Muli",
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Color(0xff0a0f0d),
//         foregroundColor: Color(4278197010),
//         elevation: 0,
//         iconTheme: IconThemeData(color: Color(0xfff5fbf6)),
//         titleTextStyle: TextStyle(color: Color(0xfff5fbf6)),
//       ),
//       cardTheme: const CardTheme().copyWith(
//         color: Color(4290236867),
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(4287552187),
//           minimumSize: Size(double.infinity, 48),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//       textTheme: ThemeData().textTheme.copyWith(
//         titleLarge: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Color(4278458898),
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }

// const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(28)),
//   borderSide: BorderSide(color: kTextColor),
//   gapPadding: 10,
// );

import 'package:flutter/material.dart';
import 'constants.dart'; // Import your constants file or define constants inline.

const kColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff196b52),
  surfaceTint: Color(0xFF018786),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xffa5f2d3),
  onPrimaryContainer: Color(0xff002116),
  secondary: Color(0xff4c6359),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffcee9db),
  onSecondaryContainer: Color(0xff082018),
  tertiary: Color(0xff3f6375),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xffc2e8fd),
  onTertiaryContainer: Color(0xff001e2b),
  error: Color(0xffba1a1a),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  surface: Color(0xfff5fbf6),
  onSurface: Color(0xff171d1a),
  onSurfaceVariant: Color(0xff404944),
  outline: Color(0xff707974),
  outlineVariant: Color(0xffbfc9c2),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffecf2ed),
  inversePrimary: Color(0xff8ad6b7),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF000000),
);

const kDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff8ad6b7),
  surfaceTint: Color.fromARGB(255, 117, 192, 162),
  onPrimary: Color(0xff003829),
  primaryContainer: Color(0xff00513c),
  onPrimaryContainer: Color(0xffa5f2d3),
  secondary: Color(0xffb3ccc0),
  onSecondary: Color(0xff1e352c),
  secondaryContainer: Color(0xff354c42),
  onSecondaryContainer: Color(0xffcee9db),
  tertiary: Color(0xffa7cce0),
  onTertiary: Color(0xff0a3445),
  tertiaryContainer: Color(0xff264b5c),
  onTertiaryContainer: Color(0xffc2e8fd),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffdad6),
  surface: Color(0xff0f1512),
  onSurface: Color(0xffdee4df),
  onSurfaceVariant: Color(0xffbfc9c2),
  outline: Color(0xff89938d),
  outlineVariant: Color(0xff404944),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xffdee4df),
  inversePrimary: Color(0xff196b52),
  background: Color(0xFF121212),
  onBackground: Color(0xFFFFFFFF),
);

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
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
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFFF),
          fontSize: 16,
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0a0f0d),
        foregroundColor: Color(0xFF121212),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xfff5fbf6)),
        titleTextStyle: TextStyle(color: Color(0xfff5fbf6)),
      ),
      cardTheme: const CardTheme().copyWith(
        color: const Color(0xFFBB86FC),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primary,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFFF),
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
