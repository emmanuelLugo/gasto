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
  double? vlGasto;

  Caixa({
    this.id,
    this.observacao,
    this.dtAbertura,
    this.isAberto,
    this.dtFechamento,
    this.vlCaixa,
    this.vlGasto,
  });

  Caixa.novo() {
    id = null;
    observacao = '';
    dtAbertura = DateTime.now();
    isAberto = true;
    dtFechamento = null;
    vlCaixa = 0;
    vlGasto = 0;
  }

  double vlDisponivel() {
    return (vlCaixa ?? 0) - (vlGasto ?? 0);
  }

  factory Caixa.fromJson(Map<String, dynamic> json) => _$CaixaFromJson(json);
  Map<String, dynamic> toJson() => _$CaixaToJson(this);

  String get status => isAberto! ? 'ABiERTO' : 'CERRADO';

  Caixa copyWith({
    int? id,
    String? observacao,
    DateTime? dtAbertura,
    bool? isAberto,
    DateTime? dtFechamento,
    double? vlCaixa,
    double? vlGasto,
  }) {
    return Caixa(
      id: id ?? this.id,
      observacao: observacao ?? this.observacao,
      dtAbertura: dtAbertura ?? this.dtAbertura,
      isAberto: isAberto ?? this.isAberto,
      dtFechamento: dtFechamento ?? this.dtFechamento,
      vlCaixa: vlCaixa ?? this.vlCaixa,
      vlGasto: vlGasto ?? this.vlGasto,
    );
  }
}
