import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_gasto/src/module/gasto/repositories/classificacao_gasto_repository.dart';

class ClassificacaoGastoService {
  final ClassificacaoGastoRepository _repository;

  ClassificacaoGastoService(
    this._repository,
  );

  Future<List<ClassificacaoGasto>> findByCondition(String condition) async {
    try {
      final sql =
          " FIN_CLASSIFICACAO_GASTO.DS_CLASSIFICACAO_GASTO LIKE '%$condition%' ";
      return await _repository.findByCondition(sql);
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<ClassificacaoGasto> save(ClassificacaoGasto classificacaoGasto) async {
    try {
      classificacaoGasto.ativo ??= true;
      return await _repository.save(classificacaoGasto);
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
