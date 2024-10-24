import 'package:app_venda/src/app_module.dart';
import 'package:app_venda/src/app_widget.dart';
import 'package:app_venda/src/core/api/host_name.dart';
import 'package:app_venda/src/core/environments/environments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environments.loadEnvs();
  await Hostname.instance.init();

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
