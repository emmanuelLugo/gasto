import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/tipo_gasto.dart';
import 'package:app_gasto/src/module/gasto/repositories/tipo_gasto_repository.dart';

class TipoGastoDelegateController {
  final TipoGastoRepository _repository;
  TipoGastoDelegateController(
    this._repository,
  );
  Future<List<TipoGasto>> findByCondition(String condition) async {
    try {
      final String sql = "DS_TIPO_GASTO like '%$condition%'";
      List<TipoGasto> response = [];

      response = await _repository.findAllTipoGasto(sql);
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
