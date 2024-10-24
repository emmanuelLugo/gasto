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

  @override
  String toString() {
    return '''

    ''';
  }
}
