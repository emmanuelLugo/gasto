import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF512DA8);
  Color get secundary => const Color.fromARGB(255, 40, 158, 160);
  Color get black => const Color(0XFF2B2A2A);
  Color get grey => Colors.grey;
  Color get greyColor => const Color.fromARGB(255, 245, 245, 245);

  Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : primary;
  }

  Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).primaryColor
        : Colors.white;
  }
}

extension ColorsAppExceptions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
