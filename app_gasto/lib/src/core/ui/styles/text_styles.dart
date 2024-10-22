import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get fontFamilly => 'roboto';

  MaterialColor get fontColor => Colors.grey;

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, color: fontColor
          // fontFamily: fontFamilly,
          );

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, color: fontColor
          // fontFamily: fontFamilly,
          );

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, color: fontColor
          // fontFamily: fontFamilly,
          );

  TextStyle get textSemiBold => const TextStyle(
        fontWeight: FontWeight.w600,
        // color: fontColor
        // fontFamily: fontFamilly,
      );

  TextStyle get textBold => const TextStyle(
        fontWeight: FontWeight.bold,
        // color: fontColor,
        // fontFamily: fontFamilly,
      );

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, color: fontColor
          // fontFamily: fontFamilly,
          );

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 20);
  TextStyle get textTableLabel => textSemiBold.copyWith(fontSize: 20);
  TextStyle get textTitle => textExtraBold.copyWith(fontSize: 22);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
