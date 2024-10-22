import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/core/global/key_constants.dart';
import 'package:app_venda/src/core/storage/local_storage_service.dart';
import 'package:app_venda/src/module/login/services/login_service.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

enum LoginState {
  initial,
  loading,
  success,
  semLicencia,
  error,
}

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginService _loginService;

  LoginControllerBase(
    this._loginService,
  );

  @readonly
  LoginState _status = LoginState.initial;

  @readonly
  String? _message;

  Future<void> autoLogin() async {
    final usuario = await LocalStorageService.instance
        .get(key: KeyConstants.loginUsuario.key);

    final senha = await LocalStorageService.instance
        .get(key: KeyConstants.loginSenha.key);

    if (senha != null && usuario != null) {
      await login(usuario, senha);
    }
  }

  Future<void> login(String login, String senha) async {
    try {
      _status = LoginState.loading;
      await _loginService.login(login, senha);
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      _status = LoginState.success;
    } on ServiceException catch (e) {
      if (e.code == 300) {
        _message = e.message;
        _status = LoginState.semLicencia;
        return;
      }
      _message = e.message;
      _status = LoginState.error;
    }
  }
}
