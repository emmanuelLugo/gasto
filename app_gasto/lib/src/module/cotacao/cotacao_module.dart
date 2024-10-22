import 'package:app_venda/src/module/core/modules/core_module.dart';
import 'package:app_venda/src/module/cotacao/pages/cotacao_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CotacaoModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  // @override
  // void binds(i) {
  //   i.addSingleton(CotacaoRepository.new);
  //   i.addSingleton(CotacaoController.new);
  // }

  @override
  void routes(r) {
    r.child('/', child: (context) => const CotacaoPage());
  }
}
