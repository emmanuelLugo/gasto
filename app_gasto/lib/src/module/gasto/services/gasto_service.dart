import 'package:app_gasto/src/core/dio/rest_client_response.dart';
import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/repositories/gasto_repository.dart';

class GastoService {
  final GastoRepository _repository;
  GastoService(
    this._repository,
  );

  Future<Gasto> save(Gasto gasto) async {
    try {
      gasto.cancelado = false;
      if (gasto.caixa == null) {
        throw ServiceException(message: 'Debe seleccionar un caja');
      }
      if (gasto.classificacaoGasto == null) {
        throw ServiceException(message: 'Debe seleccionar una clasificación');
      }
      if (gasto.dtGasto == null) {
        throw ServiceException(message: 'Debe seleccionar una fecha');
      }
      if (gasto.vlGasto == null) {
        throw ServiceException(message: 'Debe ingresar un monto');
      }
      if (gasto.descricao == null) {
        throw ServiceException(message: 'Debe ingresar una observación');
      }

      final response = await _repository.insertOrUpdate(gasto);
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<Gasto> cancelaGasto(Gasto gasto) async {
    try {
      final response = await _repository.cancelaGasto(gasto.id!);
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

  Future<RestClientResponse> findByConditionPage(
      String condition, int pageNum, int pageSize) async {
    try {
      final response = await _repository.findByConditionPage(
        condition,
        pageNum,
        pageSize,
      );
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
