import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/models/dto/gasto_por_semana_dto.dart';
import 'package:app_gasto/src/module/gasto/repositories/caixa_repository.dart';
import 'package:app_gasto/src/module/gasto/repositories/gasto_repository.dart';

class ConfiguracaoSistemaService {
  final DataShared _dataShared;
  final CaixaRepository _caixaRepository;
  final GastoRepository _gastoRepository;

  ConfiguracaoSistemaService(
    this._dataShared,
    this._caixaRepository,
    this._gastoRepository,
  );

  Future<List<Caixa>> findCaixasAbertas() async {
    try {
      final response = await _caixaRepository.findCaixasAbertas();
      _dataShared.caixasAbertas = response;
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: e.message ?? 'Error al obtener cuentas');
    }
  }

  Future<List<GastoPorSemanaDto>> findTotalGastoPorSemana() async {
    try {
      final response = await _gastoRepository.findTotalGastoPorSemana();
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: e.message ?? 'Error al obtener cuentas');
    }
  }
}
