import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum NavigationIndicators { sticky, end }

class ThemeShared extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  void change() {
    const sp = FlutterSecureStorage();
    mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    sp.write(key: "darkMode", value: mode == ThemeMode.dark ? "true" : "false");
    notifyListeners();
  }

  Future<void> init() async {
    const sp = FlutterSecureStorage();
    if (await sp.containsKey(key: "darkMode") == false) {
      sp.write(key: "darkMode", value: "false");
      mode = ThemeMode.light;
    } else {
      final dark = await sp.read(key: "darkMode");
      mode = dark == "false" ? ThemeMode.light : ThemeMode.dark;
    }
    notifyListeners();
  }
}
