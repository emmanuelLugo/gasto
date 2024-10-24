import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/gasto/models/gasto.dart';
import 'package:app_venda/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';
import 'package:app_venda/src/module/gasto/repositories/gasto_repository.dart';
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
  RelatorioGastoControllerBase(this.gastoRepository);

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
  double? vlTotal = 0.0;

  // Future<void> findGastoByCaixa(int idCaixa) async {
  //   _status = GastoStatusState.loading;
  //   try {
  //     final response = await gastoRepository.findGastoByCaixa(idCaixa);
  //     gastos = response.gastos!.asObservable();
  //     if (response.classificacoes != null) {
  //       listDto = response.classificacoes!.asObservable();
  //     }

  //     vlTotal = response.vlTotal;
  //     _status = GastoStatusState.loaded;
  //   } on ServiceException catch (e) {
  //     message = e.message;
  //     _status = GastoStatusState.error;
  //   }
  // }

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
