import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/repositories/caixa_repository.dart';

class CaixaService {
  final CaixaRepository _caixaRepository;

  CaixaService(this._caixaRepository);

  Future<List<Caixa>> getCaixas(String condition) async {
    try {
      final sql = "FIN_CAIXA.OBSERVACAO LIKE '%$condition%'";
      return await _caixaRepository.findByConditionOrderByAbertos(sql);
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<Caixa> save(Caixa caixa) async {
    try {
      return await _caixaRepository.save(caixa);
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<Caixa> atualizaStatusCaixa(Caixa caixa) async {
    try {
      return await _caixaRepository.atualizaStatusCaixaById(caixa.id!);
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
