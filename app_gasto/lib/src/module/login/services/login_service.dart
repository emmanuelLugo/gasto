import 'package:app_gasto/src/core/api/host_name.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/core/global/key_constants.dart';
import 'package:app_gasto/src/core/storage/local_storage_service.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/login/models/jwt_response.dart';
import 'package:app_gasto/src/module/login/models/usuario.dart';
import 'package:app_gasto/src/module/login/repositories/login_repository.dart';

import '../../../core/exceptions/exception_utils.dart';

class LoginService {
  final DataShared _dataShared;
  final LoginRepository _repository;

  LoginService(
    this._repository,
    this._dataShared,
  );

  Future<JwtResponse?> login(String login, String senha) async {
    if (Hostname.instance.ip.isEmpty) {
      throw ServiceException(message: 'Informe el IP en Configuración');
    }
    try {
      final response = await _repository.login(login, senha);

      final diasAVencer = response.licencia?.diasAVencer ?? -1;
      if (response.licencia == null ||
          diasAVencer <= 0 && !response.licencia!.programacao!) {
        throw ServiceException(message: "Licencia invalida", code: 300);
      }

      await saveDataInSecure(response, senha);
      await salvaUsuarioLocalStorage(response.usuario, senha);
      return response;
    } on RepositoryException catch (e) {
      if (e.code == 403) {
        throw ServiceException(message: "Usuario o seña inválidos");
      }

      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<void> salvaUsuarioLocalStorage(Usuario usuario, String senha) async {
    await LocalStorageService.instance
        .write(key: KeyConstants.loginUsuario.key, value: usuario.login);
    await LocalStorageService.instance
        .write(key: KeyConstants.loginSenha.key, value: senha);
  }

  Future<void> saveDataInSecure(JwtResponse data, String password) async {
    _dataShared.usuario = data.usuario;
    _dataShared.empresa = data.empresa;
    final diasAVencer = data.licencia?.diasAVencer ?? -1;
    final programacao = data.licencia?.programacao ?? false;

    await LocalStorageService.instance
        .write(key: "diasAVencer", value: diasAVencer.toString());
    await LocalStorageService.instance
        .write(key: "programacao", value: programacao.toString());
    await LocalStorageService.instance
        .write(key: "usuario", value: data.usuario.login);
    await LocalStorageService.instance
        .write(key: KeyConstants.token.key, value: data.jwttoken);
  }
}
