import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_gasto/src/module/gasto/services/classificacao_gasto_service.dart';

class ClassificacaoGastoDelegateController {
  final ClassificacaoGastoService _service;
  ClassificacaoGastoDelegateController(
    this._service,
  );

  Future<List<ClassificacaoGasto>> findByCondition(String condition) async {
    try {
      List<ClassificacaoGasto> response = [];
      response = await _service.findByCondition(condition);
      return response;
    } on ServiceException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
