import 'package:app_gasto/src/app_module.dart';
import 'package:app_gasto/src/app_widget.dart';
import 'package:app_gasto/src/core/api/host_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hostname.instance.init();

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
