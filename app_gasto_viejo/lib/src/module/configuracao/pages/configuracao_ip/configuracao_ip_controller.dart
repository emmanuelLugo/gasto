import 'package:app_venda/src/module/configuracao/services/configuracao_service.dart';
import 'package:mobx/mobx.dart';

part 'configuracao_ip_controller.g.dart';

enum ConfiguracaoState {
  initial,
  loading,
  success,
  error,
}

class ConfiguracaoIpController = ConfiguracaoIpControllerBase
    with _$ConfiguracaoIpController;

abstract class ConfiguracaoIpControllerBase with Store {
  final ConfiguracaoService _service;

  ConfiguracaoIpControllerBase(this._service);

  @readonly
  ConfiguracaoState _status = ConfiguracaoState.initial;

  @readonly
  String? _message;

  @action
  Future<void> salvaIP(String ip) async {
    try {
      _status = ConfiguracaoState.loading;
      await _service.saveIP(ip);
      _message = "IP actualizado con éxito";
      _status = ConfiguracaoState.success;
    } catch (e) {
      _message = e.toString();
      _status = ConfiguracaoState.error;
    }
  }
}
