// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/page_info_generic.dart';

part 'relatorio_gasto_dto.g.dart';

@JsonSerializable()
class RelatorioGastoDto {
  PageInfoGeneric<Gasto>? relatorio;
  double? vlTotal;
  RelatorioGastoDto({
    this.relatorio,
    this.vlTotal,
  });

  factory RelatorioGastoDto.fromJson(Map<String, dynamic> json) =>
      _$RelatorioGastoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RelatorioGastoDtoToJson(this);
}
