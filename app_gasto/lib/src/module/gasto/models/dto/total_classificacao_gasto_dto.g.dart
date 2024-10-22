// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_classificacao_gasto_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalClassificacaoGastoDto _$TotalClassificacaoGastoDtoFromJson(
        Map<String, dynamic> json) =>
    TotalClassificacaoGastoDto(
      idClassificacao: (json['idClassificacao'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      vlTotal: (json['vlTotal'] as num?)?.toDouble(),
      vlPorcentagem: (json['vlPorcentagem'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TotalClassificacaoGastoDtoToJson(
        TotalClassificacaoGastoDto instance) =>
    <String, dynamic>{
      'idClassificacao': instance.idClassificacao,
      'descricao': instance.descricao,
      'vlTotal': instance.vlTotal,
      'vlPorcentagem': instance.vlPorcentagem,
    };
