import 'package:app_gasto/src/module/configuracao/configuracao_module.dart';
import 'package:app_gasto/src/module/core/modules/core_module.dart';
import 'package:app_gasto/src/module/gasto/gasto_module.dart';
import 'package:app_gasto/src/module/gasto/repositories/caixa_repository.dart';
import 'package:app_gasto/src/module/gasto/repositories/gasto_repository.dart';
import 'package:app_gasto/src/module/home/pages/home/configuracao_sistema_controller.dart';
import 'package:app_gasto/src/module/home/pages/home/home_page.dart';
import 'package:app_gasto/src/module/home/services/configuracao_sistema_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton(ConfiguracaoSistemaService.new);
    i.addSingleton(ConfiguracaoSistemaController.new);
    i.addSingleton(CaixaRepository.new);
    i.addSingleton(GastoRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/configuracao', module: ConfiguracaoModule());
    r.module('/gasto', module: GastoModule());
  }
}
