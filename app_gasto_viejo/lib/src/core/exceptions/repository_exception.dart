import 'rest_client_exception.dart';

class RepositoryException implements Exception {
  String? message;
  int? code;

  RepositoryException.toException(Exception e) {
    if (e is RestClientException) {
      if (e.statusCode == 500) {
        message = "Error desconoicido";
        code = 500;
        return;
      }
      message = e.statusMessage;
      code = e.statusCode;
      return;
    }
    message = e.toString();
    code = 500;
  }

  RepositoryException(this.message, this.code);

  RepositoryException.fromException(Exception e) {
    if (e is RestClientException) {
      if (e.statusMessage != null) {
        message = e.statusMessage;
        code = e.statusCode;
        return;
      }

      if (e.statusCode == 500) {
        message = 'Error en el servidor, contacte al soporte';
        code = 500;
        return;
      }
      message = e.statusMessage;
      code = e.statusCode;
      return;
    }
    message = e.toString();
    code = 500;
  }

  @override
  String toString() {
    return message ?? '';
  }
}
