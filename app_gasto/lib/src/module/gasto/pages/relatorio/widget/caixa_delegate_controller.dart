import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/repositories/caixa_repository.dart';
import 'package:mobx/mobx.dart';

part 'caixa_delegate_controller.g.dart';

class CaixaDelegateController = CaixaDelegateControllerBase
    with _$CaixaDelegateController;

abstract class CaixaDelegateControllerBase with Store {
  final CaixaRepository _repository;
  CaixaDelegateControllerBase(this._repository);

  @action
  Future<List<Caixa>> findByCondition(String condition) async {
    try {
      final String sql = "OBSERVACAO like '%$condition%'";
      List<Caixa> response = [];

      response = await _repository.findByConditionOrderByAbertos(sql);
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
