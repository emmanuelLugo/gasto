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

  @override
  String toString() {
    return '''
message: ${message},
gastos: ${gastos},
listDto: ${listDto},
vlTotal: ${vlTotal}
    ''';
  }
}
