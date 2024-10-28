// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GastoController on GastoControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'GastoControllerBase._status', context: context);

  GastoStatusState get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  GastoStatusState get _status => status;

  @override
  set _status(GastoStatusState value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_messageAtom =
      Atom(name: 'GastoControllerBase._message', context: context);

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

  late final _$_currentRecordAtom =
      Atom(name: 'GastoControllerBase._currentRecord', context: context);

  Gasto get currentRecord {
    _$_currentRecordAtom.reportRead();
    return super._currentRecord;
  }

  @override
  Gasto get _currentRecord => currentRecord;

  @override
  set _currentRecord(Gasto value) {
    _$_currentRecordAtom.reportWrite(value, super._currentRecord, () {
      super._currentRecord = value;
    });
  }

  late final _$dataProviderAtom =
      Atom(name: 'GastoControllerBase.dataProvider', context: context);

  @override
  ObservableList<Gasto> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<Gasto> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  late final _$paginationAtom =
      Atom(name: 'GastoControllerBase.pagination', context: context);

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

  late final _$findByConditionAsyncAction =
      AsyncAction('GastoControllerBase.findByCondition', context: context);

  @override
  Future<void> findByCondition(String condition) {
    return _$findByConditionAsyncAction
        .run(() => super.findByCondition(condition));
  }

  late final _$cancelaGastoAsyncAction =
      AsyncAction('GastoControllerBase.cancelaGasto', context: context);

  @override
  Future<void> cancelaGasto(Gasto gasto) {
    return _$cancelaGastoAsyncAction.run(() => super.cancelaGasto(gasto));
  }

  @override
  String toString() {
    return '''
dataProvider: ${dataProvider},
pagination: ${pagination}
    ''';
  }
}
