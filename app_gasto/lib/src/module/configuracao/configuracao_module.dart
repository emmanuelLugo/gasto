import 'package:app_gasto/src/module/configuracao/pages/configuracao_ip/configuracao_ip_controller.dart';
import 'package:app_gasto/src/module/configuracao/pages/configuracao_ip/configuracao_ip_page.dart';
import 'package:app_gasto/src/module/configuracao/services/configuracao_service.dart';
import 'package:app_gasto/src/module/core/modules/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfiguracaoModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton(ConfiguracaoService.new);
    i.addSingleton(ConfiguracaoIpController.new);
  }

  @override
  void routes(r) {
    r.child('/configuracao_ip', child: (context) => const ConfiguracaoIpPage());
  }
}
