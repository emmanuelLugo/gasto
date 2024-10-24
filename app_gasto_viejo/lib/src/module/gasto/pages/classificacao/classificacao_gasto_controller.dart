import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_venda/src/module/gasto/models/tipo_gasto.dart';
import 'package:app_venda/src/module/gasto/services/classificacao_gasto_service.dart';
import 'package:mobx/mobx.dart';
part 'classificacao_gasto_controller.g.dart';

enum ClassificacaoGastoStatusState {
  initial,
  loading,
  loaded,
  succes,
  error,
  insert,
}

class ClassificacaoGastoController = ClassificacaoGastoControllerBase
    with _$ClassificacaoGastoController;

abstract class ClassificacaoGastoControllerBase with Store {
  final ClassificacaoGastoService _service;
  ClassificacaoGastoControllerBase(
    this._service,
  );

  @observable
  ObservableList<ClassificacaoGasto> dataProvider = ObservableList.of([]);

  @readonly
  ClassificacaoGasto _currentRecord = ClassificacaoGasto.novo();

  @readonly
  ClassificacaoGastoStatusState _status = ClassificacaoGastoStatusState.initial;

  @observable
  String message = '';

  @action
  Future<void> save() async {
    try {
      _status = ClassificacaoGastoStatusState.loading;
      final response = await _service.save(_currentRecord);
      await _atualizaClassificacaoNaList(response);
      _currentRecord = ClassificacaoGasto.novo();
      message = 'Clasificacion Gasto guardado con Exito';
      _status = ClassificacaoGastoStatusState.succes;
    } on ServiceException catch (e) {
      message = e.message;
      _status = ClassificacaoGastoStatusState.error;
    }
  }

  Future<void> _atualizaClassificacaoNaList(
      ClassificacaoGasto classificacaoGasto) async {
    final int index = dataProvider
        .indexWhere((element) => element.id == classificacaoGasto.id);

    if (index != -1) {
      dataProvider[index] = classificacaoGasto.copyWith();
    } else {
      dataProvider.insert(0, classificacaoGasto);
    }
  }

  Future<void> findByCondition(String condition) async {
    try {
      _status = ClassificacaoGastoStatusState.loading;
      List<ClassificacaoGasto> response = [];
      response = await _service.findByCondition(condition);
      dataProvider = response.asObservable();
      _status = ClassificacaoGastoStatusState.loaded;
    } on ServiceException catch (e) {
      message = e.message;
      _status = ClassificacaoGastoStatusState.error;
    }
  }

  @action
  Future<void> insert(ClassificacaoGasto classificacaoGasto) async {
    _currentRecord = classificacaoGasto;
    _status = ClassificacaoGastoStatusState.loading;
    await Future.delayed(Duration.zero);
    _status = ClassificacaoGastoStatusState.insert;
  }

  void setDescricao(String descricao) {
    _currentRecord = _currentRecord.copyWith(descricao: descricao);
  }

  void setTipoGasto(TipoGasto? tipoGasto) {
    _currentRecord = _currentRecord.copyWith(tipoGasto: tipoGasto);
  }
}
