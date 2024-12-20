import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;

  Color get primaryColor => colors.primary;
  Color get secondaryColor => colors.secundary;

  Color get blackColor => colors.black;
  Color get greyColor => colors.grey;
  Color get scaffoldBackgroundColor => colors.scaffoldColor;

  Color get errorColor => colors.error;
  Color get successColor => colors.success;
  Color get warningColor => colors.warning;
  Color get infoColor => colors.info;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color customColor({required Color darkModeColor, required Color lightModeColor}) {
    return isDarkMode ? darkModeColor : lightModeColor;
  }
}
