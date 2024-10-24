import 'package:app_venda/src/core/exceptions/exception_utils.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/gasto/models/gasto.dart';
import 'package:app_venda/src/module/gasto/repositories/gasto_repository.dart';

class GastoService {
  final GastoRepository _repository;
  GastoService(
    this._repository,
  );

  Future<Gasto> insertOrUpdate(Gasto gasto) async {
    try {
      gasto.cancelado = false;
      final response = await _repository.insertOrUpdate(gasto);
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<List<Gasto>> findByCondition(String condition) async {
    try {
      final response = await _repository.findByCondition(condition);
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
