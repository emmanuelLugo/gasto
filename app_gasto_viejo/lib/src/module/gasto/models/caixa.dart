import 'package:json_annotation/json_annotation.dart';
part 'caixa.g.dart';

@JsonSerializable()
class Caixa {
  int? id;
  String? observacao;
  DateTime? dtAbertura;
  bool? isAberto;
  DateTime? dtFechamento;
  double? vlCaixa;

  Caixa({
    this.id,
    this.observacao,
    this.dtAbertura,
    this.isAberto,
    this.dtFechamento,
    this.vlCaixa,
  });

  factory Caixa.fromJson(Map<String, dynamic> json) => _$CaixaFromJson(json);
  Map<String, dynamic> toJson() => _$CaixaToJson(this);

  Caixa copyWith({
    int? id,
    String? observacao,
    DateTime? dtAbertura,
    bool? isAberto,
    DateTime? dtFechamento,
    double? vlCaixa,
  }) {
    return Caixa(
      id: id ?? this.id,
      observacao: observacao ?? this.observacao,
      dtAbertura: dtAbertura ?? this.dtAbertura,
      isAberto: isAberto ?? this.isAberto,
      dtFechamento: dtFechamento ?? this.dtFechamento,
      vlCaixa: vlCaixa ?? this.vlCaixa,
    );
  }
}
