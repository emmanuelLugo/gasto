// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/gasto/models/classificacao_gasto.dart';
import 'package:mobx/mobx.dart';

import 'package:app_venda/src/module/gasto/models/gasto.dart';
import 'package:app_venda/src/module/gasto/services/gasto_service.dart';

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
  GastoControllerBase(
    this._service,
  );

  @readonly
  GastoStatusState _status = GastoStatusState.initial;

  @readonly
  String? _message;

  @readonly
  Gasto _currentRecord = Gasto.novo();

  Future<void> save() async {
    _status = GastoStatusState.initial;
    try {
      final response = await _service.insertOrUpdate(_currentRecord);
      _currentRecord = response;
      _message = 'Gasto guardado con Exito';
      _status = GastoStatusState.success;
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
}
