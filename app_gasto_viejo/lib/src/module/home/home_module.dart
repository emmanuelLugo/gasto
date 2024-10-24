import 'package:app_venda/src/module/configuracao/configuracao_module.dart';
import 'package:app_venda/src/module/core/modules/core_module.dart';
import 'package:app_venda/src/module/cotacao/cotacao_repository.dart';
import 'package:app_venda/src/module/cotacao/pages/cotacao_controller.dart';
import 'package:app_venda/src/module/gasto/gasto_module.dart';
import 'package:app_venda/src/module/home/pages/home/configuracao_sistema_controller.dart';
import 'package:app_venda/src/module/home/pages/home/home_page.dart';
import 'package:app_venda/src/module/home/repositories/controle_acesso_repository.dart';
import 'package:app_venda/src/module/home/repositories/parametro_repository.dart';
import 'package:app_venda/src/module/home/services/configuracao_sistema_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton(ControleAcessoRepository.new);
    i.addSingleton(ParametroRepository.new);
    i.addSingleton(CotacaoRepository.new);
    i.addSingleton(ConfiguracaoSistemaService.new);
    i.addSingleton(ConfiguracaoSistemaController.new);
    i.addSingleton(CotacaoController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/configuracao', module: ConfiguracaoModule());
    r.module('/gasto', module: GastoModule());
  }
}
