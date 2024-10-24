import 'package:app_venda/src/module/core/modules/core_module.dart';
import 'package:app_venda/src/module/home/home_module.dart';
import 'package:app_venda/src/module/login/pages/licencia/licencia_controller.dart';
import 'package:app_venda/src/module/login/pages/licencia/sem_licencia_page.dart';
import 'package:app_venda/src/module/login/pages/login/login_controller.dart';
import 'package:app_venda/src/module/login/pages/login/login_page.dart';
import 'package:app_venda/src/module/login/repositories/licencia_repository.dart';
import 'package:app_venda/src/module/login/repositories/login_repository.dart';
import 'package:app_venda/src/module/login/services/licencia_service.dart';
import 'package:app_venda/src/module/login/services/login_service.dart';
import 'package:app_venda/src/module/splash_screen/splash_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    // i.addSingleton(VendedorRepository.new);
    i.addSingleton(LoginRepository.new);

    i.addSingleton(LoginService.new);
    i.addSingleton(LoginController.new);
    i.addSingleton(LicenciaRepository.new);
    i.addSingleton(LicenciaService.new);
    i.addSingleton(LicenciaController.new);

    // i.addSingleton(ConfiguracaoService.new);
    // i.addSingleton(ConfiguracaoIpController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreenPage());
    r.child('/login', child: (context) => const LoginPage());
    r.child('/licencia', child: (_) => const SemLicenciaPage());
    r.module('/home', module: HomeModule());
  }
}
