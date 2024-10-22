// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:app_venda/src/module/cotacao/models/cotacao/item_cotacao.dart';

part 'cotacao.g.dart';

@JsonSerializable()
class Cotacao {
  int? id;
  String? dtCotacao = '';
  List<ItemCotacao>? itens;
  String? usuario;

  Cotacao({
    this.id,
    this.dtCotacao = '',
    this.itens,
    this.usuario,
  });

  factory Cotacao.fromJson(Map<String, dynamic> json) =>
      _$CotacaoFromJson(json);
  Map<String, dynamic> toJson() => _$CotacaoToJson(this);

  Cotacao copyWith({
    int? id,
    String? dtCotacao,
    List<ItemCotacao>? itens,
    String? usuario,
  }) {
    return Cotacao(
      id: id ?? this.id,
      dtCotacao: dtCotacao ?? this.dtCotacao,
      itens: itens ?? this.itens,
      usuario: usuario ?? this.usuario,
    );
  }
}
