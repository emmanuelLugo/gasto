import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gasto_dto.g.dart';

@JsonSerializable()
class GastoDto {
  List<Gasto>? gastos;
  List<TotalClassificacaoGastoDto>? classificacoes;
  double? vlTotal;

  GastoDto({
    this.gastos,
    this.vlTotal,
    this.classificacoes,
  });

  factory GastoDto.fromJson(Map<String, dynamic> json) => _$GastoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GastoDtoToJson(this);

  GastoDto copyWith({
    List<Gasto>? gastos,
    double? vlTotal,
  }) {
    return GastoDto(
      gastos: gastos ?? this.gastos,
      vlTotal: vlTotal ?? this.vlTotal,
    );
  }
}
