import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/gasto/repositories/caixa_repository.dart';

class ConfiguracaoSistemaService {
  final DataShared _dataShared;
  final CaixaRepository _caixaRepository;

  ConfiguracaoSistemaService(
    this._dataShared,
    this._caixaRepository,
  );

  Future<void> findCaixasAbertas() async {
    _dataShared.caixasAbertas = await _caixaRepository.findCaixasAbertas();
  }
}
