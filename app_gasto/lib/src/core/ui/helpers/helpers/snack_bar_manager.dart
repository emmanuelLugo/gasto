import 'package:app_gasto/src/core/ui/helpers/helpers/colors_app_extension.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/theme_extension.dart';
import 'package:flutter/material.dart';

mixin SnackbarManager<T extends StatefulWidget> on State<T> {
  static const String _defaultMessage = 'Sin Descripcion';
  static const int _defaultDuration = 2500;

  void showSuccess(String? text, {bool behaviorFloating = false, int durationMilliSecond = _defaultDuration}) {
    _show(
      text ?? _defaultMessage,
      context.successColor,
      behaviorFloating,
      durationMilliSecond,
    );
  }

  void showError(String? text, {bool behaviorFloating = false, int durationMilliSecond = _defaultDuration}) {
    _show(
      text ?? _defaultMessage,
      context.errorColor,
      behaviorFloating,
      durationMilliSecond,
    );
  }

  void showInfo(String? text, {bool behaviorFloating = false, int durationMilliSecond = _defaultDuration}) {
    _show(
      text ?? _defaultMessage,
      context.infoColor,
      behaviorFloating,
      durationMilliSecond,
    );
  }

  void showWarning(String? text, {bool behaviorFloating = false, int durationMilliSecond = _defaultDuration}) {
    _show(
      text ?? _defaultMessage,
      context.warningColor,
      behaviorFloating,
      durationMilliSecond,
    );
  }

  void _show(String text, Color backgroundColor, bool behaviorFloating, int durationMilliSecond) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      behavior: behaviorFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      content: Text(
        text,
        style: context.bodyLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      duration: Duration(milliseconds: durationMilliSecond),
      dismissDirection: DismissDirection.up,
      backgroundColor: backgroundColor,
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
