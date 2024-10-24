import 'package:app_gasto/src/module/core/modules/core_module.dart';
import 'package:app_gasto/src/module/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(r) {
    r.module(
      '/',
      module: LoginModule(),
    );
  }
}
