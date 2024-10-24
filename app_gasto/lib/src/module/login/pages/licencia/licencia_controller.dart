import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/login/services/licencia_service.dart';
import 'package:mobx/mobx.dart';

part 'licencia_controller.g.dart';

enum LicenciaStatusState {
  initial,
  loading,
  loaded,
  succes,
  error,
}

class LicenciaController = LicenciaControllerBase with _$LicenciaController;

abstract class LicenciaControllerBase with Store {
  final LicenciaService _service;

  LicenciaControllerBase(
    this._service,
  );
  @observable
  String message = '';

  @observable
  String dtVencimento = '';

  @readonly
  LicenciaStatusState _status = LicenciaStatusState.initial;

  @action
  Future<void> atualizaLicencia(String serie) async {
    try {
      _status = LicenciaStatusState.loading;
      final response = await _service.atualizaLicencia(serie);
      dtVencimento = response.dtExpiracaoString ?? '';
      _status = LicenciaStatusState.succes;
    } on ServiceException catch (e) {
      message = e.message;
      _status = LicenciaStatusState.error;
    }
  }
}
