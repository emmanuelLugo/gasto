import 'package:flutter/material.dart';
import 'colors_app.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  AppStyles._();
  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryElevatedButtonStyle => ElevatedButton.styleFrom(
      backgroundColor: ColorsApp.instance.primary,
      textStyle: TextStyles.instance.textButtonLabel,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.all(15.0));

  ButtonStyle get primaryOutlinedButtonStyle => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.white,
        textStyle: TextStyles.instance.textButtonLabel,
      );
}

extension AppStylesExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}
