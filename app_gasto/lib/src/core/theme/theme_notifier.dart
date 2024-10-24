import 'package:app_gasto/src/core/storage/local_storage_service.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    LocalStorageService.instance.write(
        key: 'isDark', value: themeMode == ThemeMode.dark ? "true" : "false");

    notifyListeners();
  }

  Future<void> getTheme() async {
    final isDark = await LocalStorageService.instance.get(key: 'isDark');
    if (isDark == "true") {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }

    notifyListeners();
  }
}
