import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/services/gasto_service.dart';
import 'package:mobx/mobx.dart';

part 'gasto_controller.g.dart';

enum GastoStatusState {
  initial,
  loading,
  loaded,
  success,
  error,
  insertOrUpdate,
  edit,
}

class GastoController = GastoControllerBase with _$GastoController;

abstract class GastoControllerBase with Store {
  final GastoService _service;
  final DataShared _dataShared;
  GastoControllerBase(
    this._service,
    this._dataShared,
  );

  @readonly
  GastoStatusState _status = GastoStatusState.initial;

  @readonly
  String? _message;

  @readonly
  Gasto _currentRecord = Gasto.novo();

  @observable
  ObservableList<Gasto> dataProvider = ObservableList<Gasto>();

  Future<void> save() async {
    _status = GastoStatusState.initial;
    try {
      final response = await _service.save(_currentRecord);
      _currentRecord = Gasto.novo();
      await _atualizaGastoNaList(response);
      _message = 'Gasto guardado con Exito';
      _status = GastoStatusState.success;
    } on ServiceException catch (e) {
      _message = e.message;
      _status = GastoStatusState.error;
    }
  }

  Future<void> _atualizaGastoNaList(Gasto gasto) async {
    final int index =
        dataProvider.indexWhere((element) => element.id == gasto.id);

    if (index != -1) {
      dataProvider[index] = gasto.copyWith();
    } else {
      dataProvider.insert(0, gasto);
    }
  }

  Future<void> findByCondition(String condition) async {
    _status = GastoStatusState.loading;
    try {
      final response = await _service.findByCondition(condition);
      dataProvider = response.asObservable();
      _status = GastoStatusState.loaded;
    } on ServiceException catch (e) {
      _message = e.message;
      _status = GastoStatusState.error;
    }
  }

  Future<void> insert(Gasto gasto) async {
    _currentRecord = gasto;
    _status = GastoStatusState.loading;
    await Future.delayed(Duration.zero);
    _status = GastoStatusState.insertOrUpdate;
  }

  @action
  Future<void> cancelaGasto(Gasto gasto) async {
    _status = GastoStatusState.loading;
    try {
      final response = await _service.cancelaGasto(gasto);
      _atualizaGastoNaList(response);
      _status = GastoStatusState.loaded;
    } on ServiceException catch (e) {
      _message = e.message;
      _status = GastoStatusState.error;
    }
  }

  void setValor(double? valor) {
    _currentRecord = _currentRecord.copyWith(vlGasto: valor);
  }

  void setDescricao(String descricao) {
    _currentRecord = _currentRecord.copyWith(descricao: descricao);
  }

  void setClassificacao(ClassificacaoGasto? classificacaoGasto) {
    _currentRecord =
        _currentRecord.copyWith(classificacaoGasto: classificacaoGasto);
  }

  void setDate(DateTime? date) {
    _currentRecord = _currentRecord.copyWith(dtGasto: date);
  }

  void setCaixa(Caixa? caixa) {
    _currentRecord = _currentRecord.copyWith(caixa: caixa);
  }

  void initGasto() {
    if (_dataShared.caixasAbertas?.length == 1) {
      _currentRecord.caixa = _dataShared.caixasAbertas![0];
    }
    _currentRecord.dtGasto = DateTime.now();
  }
}
