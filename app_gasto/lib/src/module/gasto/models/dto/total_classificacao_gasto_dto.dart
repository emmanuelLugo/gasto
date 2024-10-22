import 'package:json_annotation/json_annotation.dart';

part 'total_classificacao_gasto_dto.g.dart';

@JsonSerializable()
class TotalClassificacaoGastoDto {
  final int? idClassificacao;
  final String? descricao;
  final double? vlTotal;
  final double? vlPorcentagem;

  TotalClassificacaoGastoDto({
    this.idClassificacao,
    this.descricao,
    this.vlTotal,
    this.vlPorcentagem,
  });

  factory TotalClassificacaoGastoDto.fromJson(Map<String, dynamic> json) =>
      _$TotalClassificacaoGastoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TotalClassificacaoGastoDtoToJson(this);
}
