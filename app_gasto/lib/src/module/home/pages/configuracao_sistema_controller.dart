import 'package:app_gasto/src/core/exceptions/service_exception.dart';
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
  @readonly
  HomeStatusState _status = HomeStatusState.initial;

  @readonly
  String? _message;

  final ConfiguracaoSistemaService _configuracaoSistemaService;

  @observable
  ObservableList<GastoPorSemanaDto> gastos =
      ObservableList<GastoPorSemanaDto>();

  @observable
  double? totalGastoPorSemana;

  @observable
  double valorMaximoDeGastoPorSemana = 0.0;

  ConfiguracaoSistemaControllerBase(
    this._configuracaoSistemaService,
  );

  @action
  Future<void> handleConfiguracoesSistema() async {
    try {
      _status = HomeStatusState.loading;
      _configuracaoSistemaService.findCaixasAbertas();
      final response =
          await _configuracaoSistemaService.findTotalGastoPorSemana();
      gastos = response.asObservable();
      valorMaximoDeGastoPorSemana = obtenerMayorValor(response);
      totalGastoPorSemana = response.fold(0.0,
          (previousValue, element) => previousValue! + (element.vlTotal ?? 0));

      _status = HomeStatusState.loaded;
    } on ServiceException catch (e) {
      _message = e.toString();
      _status = HomeStatusState.error;
    }
  }

  double obtenerMayorValor(List<GastoPorSemanaDto> gastoPorSemanaList) {
    if (gastoPorSemanaList.isEmpty) {
      return 0.0;
    }
    return gastoPorSemanaList
        .map((gasto) =>
            gasto.vlTotal ?? 0) // Mapea la lista para obtener solo los valores
        .reduce((a, b) =>
            a > b ? a : b); // Usa reduce para encontrar el valor mayor
  }
}
