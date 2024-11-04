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
    final response = await _caixaRepository.findCaixasAbertas();
    _dataShared.caixasAbertas = response;
    return response;
  }

  Future<List<GastoPorSemanaDto>> findTotalGastoPorSemana() async {
    return await _gastoRepository.findTotalGastoPorSemana();
  }
}
