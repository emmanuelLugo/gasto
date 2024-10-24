import 'package:app_venda/src/module/login/models/moeda.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cotacao.dart';

part 'item_cotacao.g.dart';

@JsonSerializable()
class ItemCotacao {
  int? id;
  Cotacao? cotacao;
  Moeda? moeda;
  double vlFaturacao = 0;
  double vlFinancero = 0;
  // bool isAtivo = false;

  ItemCotacao({
    this.id,
    this.cotacao,
    this.moeda,
    this.vlFaturacao = 0,
    this.vlFinancero = 0,
    // this.isAtivo = false,
  });

  factory ItemCotacao.fromJson(Map<String, dynamic> json) =>
      _$ItemCotacaoFromJson(json);
  Map<String, dynamic> toJson() => _$ItemCotacaoToJson(this);
}
