import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/home/services/configuracao_sistema_service.dart';
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
      await consultaParametros();
      _configuracaoSistemaService.configuraIdMoedaPadrao();
      await _configuracaoSistemaService.consultaCotacaoAtual();

      _status = HomeStatusState.loaded;
    } on ServiceException catch (e) {
      _message = e.toString();
      _status = HomeStatusState.error;
    }
  }

  Future<void> consultaParametros() async {
    try {
      await _configuracaoSistemaService.consultaParametros();
    } on ServiceException catch (e) {
      _message = e.message;
      _status = HomeStatusState.error;
    }
  }
}
