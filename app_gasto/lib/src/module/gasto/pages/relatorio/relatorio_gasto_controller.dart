import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';
import 'package:app_gasto/src/module/gasto/repositories/gasto_repository.dart';
import 'package:mobx/mobx.dart';

part 'relatorio_gasto_controller.g.dart';

enum RelatorioGastoStatusState {
  initial,
  loading,
  loaded,
  success,
  error,
}

class RelatorioGastoController = RelatorioGastoControllerBase
    with _$RelatorioGastoController;

abstract class RelatorioGastoControllerBase with Store {
  final GastoRepository gastoRepository;
  final DataShared _dataShared;
  RelatorioGastoControllerBase(this.gastoRepository, this._dataShared);

  @readonly
  RelatorioGastoStatusState _status = RelatorioGastoStatusState.initial;

  @observable
  String message = '';

  @observable
  ObservableList<Gasto> gastos = ObservableList<Gasto>();

  @observable
  ObservableList<TotalClassificacaoGastoDto> listDto =
      ObservableList<TotalClassificacaoGastoDto>();

  @observable
  Caixa? caixaSelecionada;
  @observable
  List<Caixa>? caixas;

  @observable
  double? vlTotal = 0.0;

  @action
  Future<void> initGasto() async {
    caixas = _dataShared.caixasAbertas ?? [];
    if (_dataShared.caixasAbertas?.length == 1) {
      caixaSelecionada = _dataShared.caixasAbertas![0];
      caixas = _dataShared.caixasAbertas ?? [];

      if (caixaSelecionada != null) {
        await findTotalGastoPorClassificacaoByCaixa(caixaSelecionada!.id!);
      }
    }
  }

  Future<void> findTotalGastoPorTipoByCaixa(int idCaixa) async {
    _status = RelatorioGastoStatusState.loading;
    try {
      final response =
          await gastoRepository.findTotalGastoPorTipoByCaixa(idCaixa);

      if (response.classificacoes != null) {
        listDto = response.classificacoes!.asObservable();
      }
      vlTotal = response.vlTotal;
      _status = RelatorioGastoStatusState.loaded;
    } on ServiceException catch (e) {
      message = e.message;
      _status = RelatorioGastoStatusState.error;
    }
  }

  Future<void> findTotalGastoPorClassificacaoByCaixa(int idCaixa) async {
    _status = RelatorioGastoStatusState.loading;
    try {
      final response = await gastoRepository.findGastoByCaixa(idCaixa);
      gastos = response.gastos!.asObservable();
      if (response.classificacoes != null) {
        listDto = response.classificacoes!.asObservable();
      }
      vlTotal = response.vlTotal;
      _status = RelatorioGastoStatusState.loaded;
    } on ServiceException catch (e) {
      message = e.message;
      _status = RelatorioGastoStatusState.error;
    }
  }
}
