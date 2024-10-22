// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasto_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GastoDto _$GastoDtoFromJson(Map<String, dynamic> json) => GastoDto(
      gastos: (json['gastos'] as List<dynamic>?)
          ?.map((e) => Gasto.fromJson(e as Map<String, dynamic>))
          .toList(),
      vlTotal: (json['vlTotal'] as num?)?.toDouble(),
      classificacoes: (json['classificacoes'] as List<dynamic>?)
          ?.map((e) =>
              TotalClassificacaoGastoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GastoDtoToJson(GastoDto instance) => <String, dynamic>{
      'gastos': instance.gastos,
      'classificacoes': instance.classificacoes,
      'vlTotal': instance.vlTotal,
    };
