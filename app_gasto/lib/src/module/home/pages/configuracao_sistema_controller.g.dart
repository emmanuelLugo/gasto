// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracao_sistema_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfiguracaoSistemaController
    on ConfiguracaoSistemaControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ConfiguracaoSistemaControllerBase._status', context: context);

  HomeStatusState get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  HomeStatusState get _status => status;

  @override
  set _status(HomeStatusState value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_messageAtom = Atom(
      name: 'ConfiguracaoSistemaControllerBase._message', context: context);

  String? get message {
    _$_messageAtom.reportRead();
    return super._message;
  }

  @override
  String? get _message => message;

  @override
  set _message(String? value) {
    _$_messageAtom.reportWrite(value, super._message, () {
      super._message = value;
    });
  }

  late final _$gastosAtom =
      Atom(name: 'ConfiguracaoSistemaControllerBase.gastos', context: context);

  @override
  ObservableList<GastoPorSemanaDto> get gastos {
    _$gastosAtom.reportRead();
    return super.gastos;
  }

  @override
  set gastos(ObservableList<GastoPorSemanaDto> value) {
    _$gastosAtom.reportWrite(value, super.gastos, () {
      super.gastos = value;
    });
  }

  late final _$totalGastoPorSemanaAtom = Atom(
      name: 'ConfiguracaoSistemaControllerBase.totalGastoPorSemana',
      context: context);

  @override
  double? get totalGastoPorSemana {
    _$totalGastoPorSemanaAtom.reportRead();
    return super.totalGastoPorSemana;
  }

  @override
  set totalGastoPorSemana(double? value) {
    _$totalGastoPorSemanaAtom.reportWrite(value, super.totalGastoPorSemana, () {
      super.totalGastoPorSemana = value;
    });
  }

  late final _$valorMaximoDeGastoPorSemanaAtom = Atom(
      name: 'ConfiguracaoSistemaControllerBase.valorMaximoDeGastoPorSemana',
      context: context);

  @override
  double get valorMaximoDeGastoPorSemana {
    _$valorMaximoDeGastoPorSemanaAtom.reportRead();
    return super.valorMaximoDeGastoPorSemana;
  }

  @override
  set valorMaximoDeGastoPorSemana(double value) {
    _$valorMaximoDeGastoPorSemanaAtom
        .reportWrite(value, super.valorMaximoDeGastoPorSemana, () {
      super.valorMaximoDeGastoPorSemana = value;
    });
  }

  late final _$findConfiguracoesSistemaAsyncAction = AsyncAction(
      'ConfiguracaoSistemaControllerBase.findConfiguracoesSistema',
      context: context);

  @override
  Future<void> handleConfiguracoesSistema() {
    return _$findConfiguracoesSistemaAsyncAction
        .run(() => super.handleConfiguracoesSistema());
  }

  @override
  String toString() {
    return '''
gastos: ${gastos},
totalGastoPorSemana: ${totalGastoPorSemana},
valorMaximoDeGastoPorSemana: ${valorMaximoDeGastoPorSemana}
    ''';
  }
}
