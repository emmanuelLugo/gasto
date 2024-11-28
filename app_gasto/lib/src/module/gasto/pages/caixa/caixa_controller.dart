// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/services/caixa_service.dart';
import 'package:mobx/mobx.dart';

part 'caixa_controller.g.dart';

enum CaixaStatusState {
  initial,
  loading,
  loaded,
  success,
  error,
  insertOrUpdate,
  edit,
}

class CaixaController = CaixaControllerBase with _$CaixaController;

abstract class CaixaControllerBase with Store {
  final CaixaService _service;

  CaixaControllerBase(
    this._service,
  );

  @observable
  String? message;

  @observable
  ObservableList<Caixa> dataProvider = ObservableList<Caixa>();

  @readonly
  Caixa _currentRecord = Caixa.novo();

  @readonly
  CaixaStatusState _status = CaixaStatusState.initial;

  @action
  Future<void> findByCondition(String condition) async {
    _status = CaixaStatusState.loading;
    try {
      final response = await _service.getCaixas(condition);
      dataProvider = response.asObservable();
      _status = CaixaStatusState.loaded;
    } on ServiceException catch (e) {
      message = e.message;
      _status = CaixaStatusState.error;
    }
  }

  @action
  Future<void> save() async {
    try {
      _status = CaixaStatusState.loading;
      await _service.save(_currentRecord);
      // await _atualizaCaixaNaList(response);
      _currentRecord = Caixa.novo();
      message = 'Caixa guardado con Exito';
      _status = CaixaStatusState.success;
    } on ServiceException catch (e) {
      message = e.message;
      _status = CaixaStatusState.error;
    }
  }

  Future<void> atualizaStatusCaixa(Caixa caixa) async {
    _status = CaixaStatusState.loading;
    try {
      final response = await _service.atualizaStatusCaixa(caixa);
      await _atualizaCaixaNaList(response);
      _status = CaixaStatusState.success;
    } on ServiceException catch (e) {
      message = e.message;
      _status = CaixaStatusState.error;
    }
  }

  Future<void> _atualizaCaixaNaList(Caixa caixa) async {
    final int index = dataProvider.indexWhere((element) => element.id == caixa.id);

    if (index != -1) {
      dataProvider[index] = caixa.copyWith();
    } else {
      dataProvider.insert(0, caixa);
    }
  }

  Future<void> insert(Caixa caixa) async {
    _currentRecord = caixa;
    _status = CaixaStatusState.loading;
    await Future.delayed(Duration.zero);
    _status = CaixaStatusState.insertOrUpdate;
  }

  void setObservacao(String observacao) {
    _currentRecord = _currentRecord.copyWith(observacao: observacao);
  }

  void setDtAbertura(DateTime dtAbertura) {
    _currentRecord = _currentRecord.copyWith(dtAbertura: dtAbertura);
  }

  void setIsAberto(bool isAberto) {
    _currentRecord = _currentRecord.copyWith(isAberto: isAberto);
  }

  void setVlCaixa(double vlCaixa) {
    _currentRecord = _currentRecord.copyWith(vlCaixa: vlCaixa);
  }
}
