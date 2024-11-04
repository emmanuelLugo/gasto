import 'package:app_gasto/src/module/core/modules/core_module.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/caixa_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/caixa_list_view.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/caixa_page.dart';
import 'package:app_gasto/src/module/gasto/pages/classificacao/classificacao_gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/classificacao/classificacao_gasto_list_view.dart';
import 'package:app_gasto/src/module/gasto/pages/classificacao/classificacao_gasto_page.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/classificacao_gasto_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/tipo_gasto_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/gasto_list_view.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/novo_gasto_page.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/filtro_relatorio_gasto_por_filtro.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_por_tipo_view.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_por_classificacao_view.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/repositories/caixa_repository.dart';
import 'package:app_gasto/src/module/gasto/repositories/classificacao_gasto_repository.dart';
import 'package:app_gasto/src/module/gasto/repositories/gasto_repository.dart';
import 'package:app_gasto/src/module/gasto/repositories/tipo_gasto_repository.dart';
import 'package:app_gasto/src/module/gasto/services/caixa_service.dart';
import 'package:app_gasto/src/module/gasto/services/classificacao_gasto_service.dart';
import 'package:app_gasto/src/module/gasto/services/gasto_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GastoModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton(GastoRepository.new);
    i.addSingleton(RelatorioGastoController.new);
    i.addSingleton(ClassificacaoGastoRepository.new);
    i.addSingleton(ClassificacaoGastoService.new);
    i.addSingleton(ClassificacaoGastoController.new);
    i.addSingleton(TipoGastoRepository.new);
    i.addSingleton(TipoGastoDelegateController.new);
    i.addSingleton(GastoService.new);
    i.addSingleton(GastoController.new);
    i.addSingleton(ClassificacaoGastoDelegateController.new);
    i.addSingleton(CaixaDelegateController.new);
    i.addSingleton(CaixaRepository.new);
    i.addSingleton(CaixaService.new);
    i.addSingleton(CaixaController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const GastoListView());
    r.child('/novo', child: (_) => const NovoGastoPage());
    r.child('/caixa', child: (_) => const CaixaListView());
    r.child('/new-caixa', child: (_) => const CaixaPage());
    r.child('/relatorio-gasto-tipo',
        child: (_) => const RelatorioGastoPorTipoView());
    r.child('/relatorio-gasto-classificacao',
        child: (_) => const RelatorioGastoPorClassificacaoView());
    r.child('/classificacao-gasto',
        child: (_) => const ClassificacaoGastoListView());
    r.child('/classificacao-gasto/new-classificacao',
        child: (_) => const ClassificacaoGastoPage());
    r.child('/relatorio-gasto-por-filtro',
        child: (_) => const FiltroRelatorioGastoPorFiltro());
  }
}
