// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gasto _$GastoFromJson(Map<String, dynamic> json) => Gasto(
      id: (json['id'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      moeda: json['moeda'] == null
          ? null
          : Moeda.fromJson(json['moeda'] as Map<String, dynamic>),
      vlGasto: (json['vlGasto'] as num?)?.toDouble(),
      dtGasto: json['dtGasto'] == null
          ? null
          : DateTime.parse(json['dtGasto'] as String),
      usuario: json['usuario'] as String?,
      cancelado: json['cancelado'] as bool?,
      usuarioCancelamento: json['usuarioCancelamento'] as String?,
      classificacaoGasto: json['classificacaoGasto'] == null
          ? null
          : ClassificacaoGasto.fromJson(
              json['classificacaoGasto'] as Map<String, dynamic>),
      dtCancelamento: json['dtCancelamento'] == null
          ? null
          : DateTime.parse(json['dtCancelamento'] as String),
      caixa: json['caixa'] == null
          ? null
          : Caixa.fromJson(json['caixa'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GastoToJson(Gasto instance) => <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'moeda': instance.moeda,
      'vlGasto': instance.vlGasto,
      'dtGasto': instance.dtGasto?.toIso8601String(),
      'dtCancelamento': instance.dtCancelamento?.toIso8601String(),
      'usuario': instance.usuario,
      'cancelado': instance.cancelado,
      'usuarioCancelamento': instance.usuarioCancelamento,
      'classificacaoGasto': instance.classificacaoGasto,
      'caixa': instance.caixa,
    };
