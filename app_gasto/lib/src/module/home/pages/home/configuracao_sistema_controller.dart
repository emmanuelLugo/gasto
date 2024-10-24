import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/home/services/configuracao_sistema_service.dart';
import 'package:mobx/mobx.dart';

part 'configuracao_sistema_controller.g.dart';

enum HomeStatusState {
  initial,
  loading,
  loaded,
  error,
}

class ConfiguracaoSistemaController = ConfiguracaoSistemaControllerBase
    with _$ConfiguracaoSistemaController;

abstract class ConfiguracaoSistemaControllerBase with Store {
  @readonly
  HomeStatusState _status = HomeStatusState.initial;

  @readonly
  String? _message;

  final ConfiguracaoSistemaService _configuracaoSistemaService;

  ConfiguracaoSistemaControllerBase(
    this._configuracaoSistemaService,
  );

  Future<void> findConfiguracoesSistema() async {
    try {
      _status = HomeStatusState.loading;
      _configuracaoSistemaService.findCaixasAbertas();
      _status = HomeStatusState.loaded;
    } on ServiceException catch (e) {
      _message = e.toString();
      _status = HomeStatusState.error;
    }
  }
}
