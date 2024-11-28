// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorio_gasto_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatorioGastoDto _$RelatorioGastoDtoFromJson(Map<String, dynamic> json) =>
    RelatorioGastoDto(
      relatorio: json['relatorio'] == null
          ? null
          : PageInfoGasto<Gasto>.fromJson(
              json['relatorio'] as Map<String, dynamic>),
      vlTotal: (json['vlTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RelatorioGastoDtoToJson(RelatorioGastoDto instance) =>
    <String, dynamic>{
      'relatorio': instance.relatorio,
      'vlTotal': instance.vlTotal,
    };
