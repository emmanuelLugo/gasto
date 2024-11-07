import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/core/global/key_constants.dart';
import 'package:app_gasto/src/core/storage/local_storage_service.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/models/dto/gasto_por_semana_dto.dart';
import 'package:app_gasto/src/module/home/services/configuracao_sistema_service.dart';
import 'package:mobx/mobx.dart';

part 'configuracao_sistema_controller.g.dart';

enum HomeStatusState {
  initial,
  loading,
  loaded,
  error,
}

class ConfiguracaoSistemaController = ConfiguracaoSistemaControllerBase
    with _$ConfiguracaoSistemaController;

abstract class ConfiguracaoSistemaControllerBase with Store {
  final ConfiguracaoSistemaService _configuracaoSistemaService;

  @readonly
  HomeStatusState _status = HomeStatusState.initial;

  @readonly
  String? _message;

  @observable
  ObservableList<GastoPorSemanaDto> gastos = ObservableList.of([]);

  @observable
  ObservableList<Caixa> caixasAbertas = ObservableList.of([]);

  @observable
  double? totalGastoPorSemana;

  @observable
  double valorMaximoDeGastoPorSemana = 0.0;

  @observable
  bool mostrarValorDeCaixa = true;

  ConfiguracaoSistemaControllerBase(
    this._configuracaoSistemaService,
  ) {
    _initialize();
  }

  @action
  Future<void> handleConfiguracoesSistema() async {
    try {
      _status = HomeStatusState.loading;
      final responseCaixas =
          await _configuracaoSistemaService.findCaixasAbertas();
      caixasAbertas = responseCaixas.asObservable();
      final response =
          await _configuracaoSistemaService.findTotalGastoPorSemana();
      gastos = response.asObservable();
      valorMaximoDeGastoPorSemana = _getValorMaximoGasto(response);
      totalGastoPorSemana = _getValorTotalGasto(response);

      _status = HomeStatusState.loaded;
    } on ServiceException catch (e) {
      _message = e.toString();
      _status = HomeStatusState.error;
    }
  }

  double _getValorTotalGasto(List<GastoPorSemanaDto> gastoPorSemanaList) {
    if (gastoPorSemanaList.isEmpty) {
      return 0.0;
    }
    return gastoPorSemanaList.fold(0.0,
        (previousValue, element) => previousValue + (element.vlTotal ?? 0));
  }

  double _getValorMaximoGasto(List<GastoPorSemanaDto> gastoPorSemanaList) {
    if (gastoPorSemanaList.isEmpty) {
      return 0.0;
    }
    return gastoPorSemanaList
        .map((gasto) => gasto.vlTotal ?? 0)
        .reduce((a, b) => a > b ? a : b);
  }

  @action
  Future<void> toggleMostrarValorDeCaixa() async {
    mostrarValorDeCaixa = !mostrarValorDeCaixa;
    await _setMostraValorCaixa(mostrarValorDeCaixa);
  }

  Future<void> _initialize() async {
    mostrarValorDeCaixa = await _getMostraValorCaixa();
    // await handleConfiguracoesSistema();
  }

  Future<bool> _getMostraValorCaixa() async {
    final value = await LocalStorageService.instance
        .get(key: KeyConstants.mostraValorCaixa.key);
    return value == 'true';
  }

  Future<void> _setMostraValorCaixa(bool value) async {
    await LocalStorageService.instance
        .write(key: KeyConstants.mostraValorCaixa.key, value: value.toString());
  }
}
