import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_style.dart';
import 'colors_app.dart';

class ThemeConfig {
  ThemeConfig._();

  static const labelColor = Colors.black;

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      color: Colors.grey[400]!,
    ),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorsApp.instance.primary,
    primaryIconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      elevation: 3,
      shadowColor: Colors.white,
      backgroundColor: ColorsApp.instance.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secundary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryElevatedButtonStyle,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: AppStyles.instance.primaryOutlinedButtonStyle),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        color: labelColor,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: labelColor,
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.poppins(
        color: labelColor,
        fontSize: 12,
      ),
      labelLarge: GoogleFonts.poppins(color: labelColor),
      labelMedium: GoogleFonts.poppins(color: labelColor),
      labelSmall: GoogleFonts.poppins(color: labelColor),
      displayLarge: GoogleFonts.poppins(color: labelColor),
      displayMedium: GoogleFonts.poppins(color: labelColor),
      displaySmall: GoogleFonts.poppins(color: labelColor),
      headlineLarge: GoogleFonts.poppins(color: labelColor),
      headlineMedium: GoogleFonts.poppins(color: labelColor),
      headlineSmall: GoogleFonts.poppins(color: labelColor),
      titleSmall: GoogleFonts.poppins(color: labelColor),
      titleMedium: GoogleFonts.poppins(color: labelColor),
      titleLarge: GoogleFonts.poppins(color: labelColor),
    ),
    listTileTheme: ListTileThemeData(
      textColor: labelColor,
      titleTextStyle: GoogleFonts.poppins(
          color: labelColor, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      disabledBorder: _defaultInputBorder,
      hintStyle: GoogleFonts.poppins(
        color: labelColor,
      ),
      labelStyle: GoogleFonts.poppins(
        color: labelColor,
      ),
      errorStyle: GoogleFonts.poppins(
        color: Colors.redAccent,
      ),
    ),
  );

  // static final darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   textSelectionTheme: TextSelectionThemeData(
  //       cursorColor: ColorsApp.instance.primary,
  //       selectionColor: ColorsApp.instance.primary,
  //       selectionHandleColor: ColorsApp.instance.primary),
  //   textButtonTheme: TextButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       foregroundColor: ColorsApp.instance.primary,
  //     ),
  //   ),
  //   textTheme: TextTheme(
  //     bodyLarge: GoogleFonts.poppins(
  //       fontSize: 16,
  //     ),
  //     bodyMedium: GoogleFonts.poppins(
  //       fontSize: 14,
  //     ),
  //     bodySmall: GoogleFonts.poppins(
  //       fontSize: 12,
  //     ),
  //   ),
  //   listTileTheme: const ListTileThemeData(
  //     titleTextStyle: TextStyle(
  //       fontWeight: FontWeight.bold,
  //       fontSize: 18,
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       textStyle: TextStyles.instance.textButtonLabel,
  //       foregroundColor: Colors.white,
  //       padding: const EdgeInsets.all(15.0),
  //     ),
  //   ),
  //   inputDecorationTheme: InputDecorationTheme(
  //     border: _defaultInputBorder,
  //     enabledBorder: _defaultInputBorder,
  //     focusedBorder: _defaultInputBorder,
  //     disabledBorder: _defaultInputBorder,
  //     errorBorder: _defaultInputBorder.copyWith(
  //       borderSide: const BorderSide(
  //         color: Colors.red,
  //       ),
  //     ),
  //     hintStyle: GoogleFonts.poppins(
  //       color: Colors.white,
  //     ),
  //     labelStyle: GoogleFonts.poppins(
  //       color: Colors.white,
  //     ),
  //     errorStyle: GoogleFonts.poppins(
  //       color: Colors.red,
  //     ),
  //   ),
  // );
}
