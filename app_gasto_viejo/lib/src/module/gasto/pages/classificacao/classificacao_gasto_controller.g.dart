// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classificacao_gasto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClassificacaoGastoController
    on ClassificacaoGastoControllerBase, Store {
  late final _$dataProviderAtom = Atom(
      name: 'ClassificacaoGastoControllerBase.dataProvider', context: context);

  @override
  ObservableList<ClassificacaoGasto> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<ClassificacaoGasto> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  late final _$_currentRecordAtom = Atom(
      name: 'ClassificacaoGastoControllerBase._currentRecord',
      context: context);

  ClassificacaoGasto get currentRecord {
    _$_currentRecordAtom.reportRead();
    return super._currentRecord;
  }

  @override
  ClassificacaoGasto get _currentRecord => currentRecord;

  @override
  set _currentRecord(ClassificacaoGasto value) {
    _$_currentRecordAtom.reportWrite(value, super._currentRecord, () {
      super._currentRecord = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: 'ClassificacaoGastoControllerBase._status', context: context);

  ClassificacaoGastoStatusState get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ClassificacaoGastoStatusState get _status => status;

  @override
  set _status(ClassificacaoGastoStatusState value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'ClassificacaoGastoControllerBase.message', context: context);

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

  late final _$saveAsyncAction =
      AsyncAction('ClassificacaoGastoControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$insertAsyncAction =
      AsyncAction('ClassificacaoGastoControllerBase.insert', context: context);

  @override
  Future<void> insert(ClassificacaoGasto classificacaoGasto) {
    return _$insertAsyncAction.run(() => super.insert(classificacaoGasto));
  }

  @override
  String toString() {
    return '''
dataProvider: ${dataProvider},
message: ${message}
    ''';
  }
}
