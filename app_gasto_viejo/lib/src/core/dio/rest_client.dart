import 'dart:developer';

import 'package:app_venda/src/core/api/host_name.dart';
import 'package:app_venda/src/core/dio/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

import '../exceptions/rest_client_exception.dart';
import 'i_rest_client.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/no_auth_interceptor.dart';
import 'rest_client_response.dart';

class RestClient implements IRestClient {
  late Dio _dio;
  final _cancelToken = CancelToken();

  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Hostname.instance.ip,
    followRedirects: false,
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 30),
  );

  RestClient() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.addAll([
      ErrorInterceptor(),
      NoAuthInterceptor(),
    ]);
  }

  RestClient.auth() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.addAll([
      ErrorInterceptor(),
      AuthInterceptor(),
    ]);
  }

  updateURL() {
    // _baseOptions = BaseOptions(
    //   baseUrl: Hostname.instance.ip,
    //   followRedirects: false,
    //   connectTimeout: const Duration(seconds: 120),
    //   receiveTimeout: const Duration(seconds: 10),
    // );
    // _dio.options = _baseOptions;
    _baseOptions.baseUrl = Hostname.instance.ip;
    _dio.options = _baseOptions;
  }

  void cancelRequests() {
    _cancelToken.cancel("Solicitudes canceladas.");
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final responde = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _successManager<T>(responde);
    } on DioException catch (e) {
      return _errorManager(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final responde = await _dio.get(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return _successManager<T>(responde);
    } on DioException catch (e) {
      return _errorManager(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final responde = await _dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _successManager<T>(responde);
    } on DioException catch (e) {
      return _errorManager(e);
    }
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final responde = await _dio.delete(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return _successManager<T>(responde);
    } on DioException catch (e) {
      return _errorManager(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    return _handleRequest<T>(() => _dio.patch(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: _cancelToken));
  }

  Future<RestClientResponse<T>> _handleRequest<T>(
      Future<Response> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      return _successManager<T>(response);
    } on DioException catch (e) {
      return _errorManager(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final responde = await _dio.request(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return _successManager<T>(responde);
    } on DioException catch (e) {
      return _errorManager(e);
    }
  }

  _errorManager(e) {
    _logErrorManager(e);
    if (e.error is String) {
      if (e != null && e.error.toString().contains("500")) {
        throw RestClientException(
            statusMessage: "Error desconocido",
            statusCode: e.response?.statusCode,
            error: e);
      }

      throw RestClientException(
          statusMessage: e?.error ?? "Error desconocido",
          statusCode: e.response?.statusCode,
          error: e);
    } else if (e?.response?.statusCode == 401) {
      throw RestClientException(
          statusMessage: 'Session Expirada, favor volver a Loguearse',
          statusCode: e?.response?.statusCode,
          error: e);
    } else {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw RestClientException(
            statusMessage: 'Tiempo de conexión excedido. [CONNECTION TIMEOUT]',
            statusCode: e?.response?.statusCode ?? 503,
            error: e);
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw RestClientException(
            statusMessage: 'Tiempo de recepción excedido. [TIMEOUT]',
            statusCode: e?.response?.statusCode ?? 503,
            error: e);
      }

      throw RestClientException(
          statusMessage: e?.error?.statusMessage ?? e?.response?.data as String,
          statusCode: e?.response?.statusCode ?? 503,
          error: e);
    }
  }

  RestClientResponse<T> _successManager<T>(Response<dynamic> response) {
    return RestClientResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage);
  }

  void _logErrorManager(e) {
    String errorMessage;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Tiempo de conexión excedido.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Tiempo de recepción excedido.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Tiempo de envío excedido.';
        break;
      case DioExceptionType.badResponse:
        if (e?.response?.statusCode == 401) {
          errorMessage = 'Session Expirada: ${e.response?.statusCode}';
          break;
        }
        errorMessage = 'Error del servidor: ${e.response?.statusCode}';
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Solicitud cancelada.';
        break;
      case DioExceptionType.unknown:
      default:
        errorMessage = 'Error desconocido: ${e.message}';
        break;
    }
    log(errorMessage);
  }
}
