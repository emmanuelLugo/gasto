import 'dart:developer';

import 'package:app_venda/src/core/api/host_name.dart';
import 'package:app_venda/src/core/global/key_constants.dart';
import 'package:app_venda/src/core/storage/local_storage_service.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? usuario;
    String? token;

    token = await LocalStorageService.instance.get(key: KeyConstants.token.key);
    usuario =
        await LocalStorageService.instance.get(key: KeyConstants.usuario.key);

    options.headers['authorization'] = 'Bearer $token';
    options.headers['usuario'] = usuario;
    options.headers['Access-Control-Allow-Origin'] = "*";
    options.headers['Access-Control-Allow-Credentials'] = true;
    options.headers['Access-Control-Allow-Headers'] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    options.headers['Access-Control-Allow-Methods'] = "GET, PUT, POST, OPTIONS";
    log('REQUEST AUTH[${options.method}] => PATH:  ${Hostname.instance.ip}${options.path}');

    handler.next(options);
  }
}
