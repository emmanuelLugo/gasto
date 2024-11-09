// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorio_gasto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RelatorioGastoController on RelatorioGastoControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'RelatorioGastoControllerBase._status', context: context);

  RelatorioGastoStatusState get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  RelatorioGastoStatusState get _status => status;

  @override
  set _status(RelatorioGastoStatusState value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'RelatorioGastoControllerBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$gastosAtom =
      Atom(name: 'RelatorioGastoControllerBase.gastos', context: context);

  @override
  ObservableList<Gasto> get gastos {
    _$gastosAtom.reportRead();
    return super.gastos;
  }

  @override
  set gastos(ObservableList<Gasto> value) {
    _$gastosAtom.reportWrite(value, super.gastos, () {
      super.gastos = value;
    });
  }

  late final _$listDtoAtom =
      Atom(name: 'RelatorioGastoControllerBase.listDto', context: context);

  @override
  ObservableList<TotalClassificacaoGastoDto> get listDto {
    _$listDtoAtom.reportRead();
    return super.listDto;
  }

  @override
  set listDto(ObservableList<TotalClassificacaoGastoDto> value) {
    _$listDtoAtom.reportWrite(value, super.listDto, () {
      super.listDto = value;
    });
  }

  late final _$caixaSelecionadaAtom = Atom(
      name: 'RelatorioGastoControllerBase.caixaSelecionada', context: context);

  @override
  Caixa? get caixaSelecionada {
    _$caixaSelecionadaAtom.reportRead();
    return super.caixaSelecionada;
  }

  @override
  set caixaSelecionada(Caixa? value) {
    _$caixaSelecionadaAtom.reportWrite(value, super.caixaSelecionada, () {
      super.caixaSelecionada = value;
    });
  }

  late final _$caixasAtom =
      Atom(name: 'RelatorioGastoControllerBase.caixas', context: context);

  @override
  List<Caixa>? get caixas {
    _$caixasAtom.reportRead();
    return super.caixas;
  }

  @override
  set caixas(List<Caixa>? value) {
    _$caixasAtom.reportWrite(value, super.caixas, () {
      super.caixas = value;
    });
  }

  late final _$vlTotalAtom =
      Atom(name: 'RelatorioGastoControllerBase.vlTotal', context: context);

  @override
  double? get vlTotal {
    _$vlTotalAtom.reportRead();
    return super.vlTotal;
  }

  @override
  set vlTotal(double? value) {
    _$vlTotalAtom.reportWrite(value, super.vlTotal, () {
      super.vlTotal = value;
    });
  }

  late final _$paginationAtom =
      Atom(name: 'RelatorioGastoControllerBase.pagination', context: context);

  @override
  Pagination get pagination {
    _$paginationAtom.reportRead();
    return super.pagination;
  }

  @override
  set pagination(Pagination value) {
    _$paginationAtom.reportWrite(value, super.pagination, () {
      super.pagination = value;
    });
  }

  late final _$conditionAtom =
      Atom(name: 'RelatorioGastoControllerBase.condition', context: context);

  @override
  String get condition {
    _$conditionAtom.reportRead();
    return super.condition;
  }

  @override
  set condition(String value) {
    _$conditionAtom.reportWrite(value, super.condition, () {
      super.condition = value;
    });
  }

  late final _$initGastoAsyncAction =
      AsyncAction('RelatorioGastoControllerBase.initGasto', context: context);

  @override
  Future<void> initGasto() {
    return _$initGastoAsyncAction.run(() => super.initGasto());
  }

  late final _$findTotalGastoPorTipoByCaixaAsyncAction = AsyncAction(
      'RelatorioGastoControllerBase.findTotalGastoPorTipoByCaixa',
      context: context);

  @override
  Future<void> findTotalGastoPorTipoByCaixa(int idCaixa) {
    return _$findTotalGastoPorTipoByCaixaAsyncAction
        .run(() => super.findTotalGastoPorTipoByCaixa(idCaixa));
  }

  late final _$findTotalGastoPorClassificacaoByCaixaAsyncAction = AsyncAction(
      'RelatorioGastoControllerBase.findTotalGastoPorClassificacaoByCaixa',
      context: context);

  @override
  Future<void> findTotalGastoPorClassificacaoByCaixa(int idCaixa) {
    return _$findTotalGastoPorClassificacaoByCaixaAsyncAction
        .run(() => super.findTotalGastoPorClassificacaoByCaixa(idCaixa));
  }

  late final _$findRelatorioGastoByConditionAsyncAction = AsyncAction(
      'RelatorioGastoControllerBase.findRelatorioGastoByCondition',
      context: context);

  @override
  Future<void> findRelatorioGastoByCondition() {
    return _$findRelatorioGastoByConditionAsyncAction
        .run(() => super.findRelatorioGastoByCondition());
  }

  late final _$findByConditionAsyncAction = AsyncAction(
      'RelatorioGastoControllerBase.findByCondition',
      context: context);

  @override
  Future<List<Gasto>> findByCondition(String condition) {
    return _$findByConditionAsyncAction
        .run(() => super.findByCondition(condition));
  }

  late final _$RelatorioGastoControllerBaseActionController =
      ActionController(name: 'RelatorioGastoControllerBase', context: context);

  @override
  void setCaixaSelecionada(Caixa caixa) {
    final _$actionInfo = _$RelatorioGastoControllerBaseActionController
        .startAction(name: 'RelatorioGastoControllerBase.setCaixaSelecionada');
    try {
      return super.setCaixaSelecionada(caixa);
    } finally {
      _$RelatorioGastoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
gastos: ${gastos},
listDto: ${listDto},
caixaSelecionada: ${caixaSelecionada},
caixas: ${caixas},
vlTotal: ${vlTotal},
pagination: ${pagination},
condition: ${condition}
    ''';
  }
}
