import 'package:dio/dio.dart';

import 'repository_exception.dart';
import 'rest_client_exception.dart';
import 'service_exception.dart';

class ExceptionUtils {
  static String getExceptionMessage(dynamic exception) {
    switch (exception.runtimeType) {
      case RestClientException _:
        return exception.statusMessage ?? "Error desconocido";
      case RepositoryException _:
        return exception.message ?? "Error desconocido";
      case ServiceException _:
        return exception.message ?? "Error desconocido";
      case DioException _:
        return exception.toString();
      case Exception _:
        return exception.toString();
      case Error _:
        return exception.toString();
      default:
        return exception.toString();
    }
  }
}
