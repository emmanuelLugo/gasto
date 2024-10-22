// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CotacaoController on CotacaoControllerBase, Store {
  late final _$novaCotacaoAtom =
      Atom(name: 'CotacaoControllerBase.novaCotacao', context: context);

  @override
  Cotacao get novaCotacao {
    _$novaCotacaoAtom.reportRead();
    return super.novaCotacao;
  }

  @override
  set novaCotacao(Cotacao value) {
    _$novaCotacaoAtom.reportWrite(value, super.novaCotacao, () {
      super.novaCotacao = value;
    });
  }

  late final _$cotacaoAtom =
      Atom(name: 'CotacaoControllerBase.cotacao', context: context);

  @override
  Cotacao get cotacao {
    _$cotacaoAtom.reportRead();
    return super.cotacao;
  }

  @override
  set cotacao(Cotacao value) {
    _$cotacaoAtom.reportWrite(value, super.cotacao, () {
      super.cotacao = value;
    });
  }

  late final _$isCarregaCotacaoAtom =
      Atom(name: 'CotacaoControllerBase.isCarregaCotacao', context: context);

  @override
  bool get isCarregaCotacao {
    _$isCarregaCotacaoAtom.reportRead();
    return super.isCarregaCotacao;
  }

  @override
  set isCarregaCotacao(bool value) {
    _$isCarregaCotacaoAtom.reportWrite(value, super.isCarregaCotacao, () {
      super.isCarregaCotacao = value;
    });
  }

  late final _$cotacoesAtom =
      Atom(name: 'CotacaoControllerBase.cotacoes', context: context);

  @override
  ObservableList<ItemCotacao> get cotacoes {
    _$cotacoesAtom.reportRead();
    return super.cotacoes;
  }

  @override
  set cotacoes(ObservableList<ItemCotacao> value) {
    _$cotacoesAtom.reportWrite(value, super.cotacoes, () {
      super.cotacoes = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'CotacaoControllerBase.message', context: context);

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

  late final _$_statusAtom =
      Atom(name: 'CotacaoControllerBase._status', context: context);

  CotacaoStatusState get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  CotacaoStatusState get _status => status;

  @override
  set _status(CotacaoStatusState value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$findUltimaCotacaoAsyncAction =
      AsyncAction('CotacaoControllerBase.findUltimaCotacao', context: context);

  @override
  Future<void> findUltimaCotacao() {
    return _$findUltimaCotacaoAsyncAction.run(() => super.findUltimaCotacao());
  }

  late final _$saveAsyncAction =
      AsyncAction('CotacaoControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$CotacaoControllerBaseActionController =
      ActionController(name: 'CotacaoControllerBase', context: context);

  @override
  void trocaMoedaEstado(ItemCotacao item, bool value) {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.trocaMoedaEstado');
    try {
      return super.trocaMoedaEstado(item, value);
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double converteVlFaturacao(double valor, int idMoeda) {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.converteVlFaturacao');
    try {
      return super.converteVlFaturacao(valor, idMoeda);
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double converteVlAMoedaCotacao(double valor, int idMoeda) {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.converteVlAMoedaCotacao');
    try {
      return super.converteVlAMoedaCotacao(valor, idMoeda);
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double converteVlTotaVenta(double valor, int idMoeda) {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.converteVlTotaVenta');
    try {
      return super.converteVlTotaVenta(valor, idMoeda);
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String converteVlFaturacaoEFormatado(double valor, int idMoeda) {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.converteVlFaturacaoEFormatado');
    try {
      return super.converteVlFaturacaoEFormatado(valor, idMoeda);
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double converteVlRecebimentoAMoedaBase(double valor, int idMoeda) {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.converteVlRecebimentoAMoedaBase');
    try {
      return super.converteVlRecebimentoAMoedaBase(valor, idMoeda);
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String converteAMoedaBase(double valor) {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.converteAMoedaBase');
    try {
      return super.converteAMoedaBase(valor);
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int moedaBasePrecision() {
    final _$actionInfo = _$CotacaoControllerBaseActionController.startAction(
        name: 'CotacaoControllerBase.moedaBasePrecision');
    try {
      return super.moedaBasePrecision();
    } finally {
      _$CotacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
novaCotacao: ${novaCotacao},
cotacao: ${cotacao},
isCarregaCotacao: ${isCarregaCotacao},
cotacoes: ${cotacoes},
message: ${message}
    ''';
  }
}
