import 'package:app_venda/src/core/exceptions/exception_utils.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/gasto/models/tipo_gasto.dart';
import 'package:app_venda/src/module/gasto/repositories/tipo_gasto_repository.dart';

class TipoGastoService {
  final TipoGastoRepository _repository;
  TipoGastoService(
    this._repository,
  );

  Future<List<TipoGasto>> findAllTipoGasto(String condition) async {
    try {
      return _repository.findAllTipoGasto(condition);
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
