import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/page_info_gasto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relatorio_gasto_dto.g.dart';

@JsonSerializable()
class RelatorioGastoDto {
  PageInfoGasto<Gasto>? relatorio;
  double? vlTotal;
  RelatorioGastoDto({
    this.relatorio,
    this.vlTotal,
  });

  factory RelatorioGastoDto.fromJson(Map<String, dynamic> json) => _$RelatorioGastoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RelatorioGastoDtoToJson(this);
}
