// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasto_por_semana_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GastoPorSemanaDto _$GastoPorSemanaDtoFromJson(Map<String, dynamic> json) =>
    GastoPorSemanaDto(
      vlTotal: (json['vlTotal'] as num?)?.toDouble(),
      diasDaSemana: (json['diasDaSemana'] as num?)?.toInt(),
      diasDaSemanaString: json['diasDaSemanaString'] as String?,
    );

Map<String, dynamic> _$GastoPorSemanaDtoToJson(GastoPorSemanaDto instance) =>
    <String, dynamic>{
      'vlTotal': instance.vlTotal,
      'diasDaSemana': instance.diasDaSemana,
      'diasDaSemanaString': instance.diasDaSemanaString,
    };
