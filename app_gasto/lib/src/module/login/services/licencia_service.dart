import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/login/models/licencia.dart';
import 'package:app_venda/src/module/login/repositories/licencia_repository.dart';

import '../../../core/exceptions/exception_utils.dart';

class LicenciaService {
  final LicenciaRepository _repository;

  LicenciaService(
    this._repository,
  );

  Future<Licencia> atualizaLicencia(String serie) async {
    try {
      final response = await _repository.atualizaLicencia(serie);
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
