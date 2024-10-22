import 'package:app_venda/src/module/gasto/models/caixa.dart';
import 'package:app_venda/src/module/login/models/moeda.dart';
import 'package:json_annotation/json_annotation.dart';

import 'classificacao_gasto.dart';

part 'gasto.g.dart';

@JsonSerializable()
class Gasto {
  int? id;
  String? descricao;
  Moeda? moeda;
  double? vlGasto;
  String? dtGasto;
  String? usuario;
  bool? cancelado;
  String? usuarioCancelamento;
  ClassificacaoGasto? classificacaoGasto;
  Caixa? caixa;

  Gasto({
    this.id,
    this.descricao,
    this.moeda,
    this.vlGasto,
    this.dtGasto,
    this.usuario,
    this.cancelado,
    this.usuarioCancelamento,
    this.classificacaoGasto,
    this.caixa,
  });

  factory Gasto.fromJson(Map<String, dynamic> json) => _$GastoFromJson(json);
  Map<String, dynamic> toJson() => _$GastoToJson(this);

  Gasto copyWith({
    int? id,
    String? descricao,
    Moeda? moeda,
    double? vlGasto,
    String? dtGasto,
    String? usuario,
    bool? cancelado,
    String? usuarioCancelamento,
    ClassificacaoGasto? classificacaoGasto,
    Caixa? caixa,
  }) {
    return Gasto(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      moeda: moeda ?? this.moeda,
      vlGasto: vlGasto ?? this.vlGasto,
      dtGasto: dtGasto ?? this.dtGasto,
      usuario: usuario ?? this.usuario,
      cancelado: cancelado ?? this.cancelado,
      usuarioCancelamento: usuarioCancelamento ?? this.usuarioCancelamento,
      classificacaoGasto: classificacaoGasto ?? this.classificacaoGasto,
      caixa: caixa ?? this.caixa,
    );
  }

  Gasto.novo() {
    cancelado = false;
    vlGasto = 0;
    moeda = Moeda.moedas().first;
    classificacaoGasto = null;
  }
}
