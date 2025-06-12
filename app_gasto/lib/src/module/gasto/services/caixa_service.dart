import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/repositories/caixa_repository.dart';

class CaixaService {
  final CaixaRepository _caixaRepository;
  final DataShared _dataShared;

  CaixaService(this._caixaRepository, this._dataShared);

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
      return await _caixaRepository.save(caixa).then((value) {
        findCaixasAbertas();
        return value;
      });
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<List<Caixa>> findCaixasAbertas() async {
    try {
      final response = await _caixaRepository.findCaixasAbertas();
      _dataShared.caixasAbertas = response;
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: e.message ?? 'Error al obtener cuentas');
    }
  }

  Future<Caixa> atualizaStatusCaixa(Caixa caixa) async {
    try {
      return await _caixaRepository
          .atualizaStatusCaixaById(caixa.id!)
          .then((value) {
        findCaixasAbertas();
        return value;
      });
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
