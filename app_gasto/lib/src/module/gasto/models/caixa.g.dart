// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Caixa _$CaixaFromJson(Map<String, dynamic> json) => Caixa(
      id: (json['id'] as num?)?.toInt(),
      observacao: json['observacao'] as String?,
      dtAbertura: json['dtAbertura'] == null
          ? null
          : DateTime.parse(json['dtAbertura'] as String),
      isAberto: json['isAberto'] as bool?,
      dtFechamento: json['dtFechamento'] == null
          ? null
          : DateTime.parse(json['dtFechamento'] as String),
      vlCaixa: (json['vlCaixa'] as num?)?.toDouble(),
      vlGasto: (json['vlGasto'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CaixaToJson(Caixa instance) => <String, dynamic>{
      'id': instance.id,
      'observacao': instance.observacao,
      'dtAbertura': instance.dtAbertura?.toIso8601String(),
      'isAberto': instance.isAberto,
      'dtFechamento': instance.dtFechamento?.toIso8601String(),
      'vlCaixa': instance.vlCaixa,
      'vlGasto': instance.vlGasto,
    };
