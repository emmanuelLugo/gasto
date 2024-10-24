// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_cotacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCotacao _$ItemCotacaoFromJson(Map<String, dynamic> json) => ItemCotacao(
      id: (json['id'] as num?)?.toInt(),
      cotacao: json['cotacao'] == null
          ? null
          : Cotacao.fromJson(json['cotacao'] as Map<String, dynamic>),
      moeda: json['moeda'] == null
          ? null
          : Moeda.fromJson(json['moeda'] as Map<String, dynamic>),
      vlFaturacao: (json['vlFaturacao'] as num?)?.toDouble() ?? 0,
      vlFinancero: (json['vlFinancero'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ItemCotacaoToJson(ItemCotacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cotacao': instance.cotacao,
      'moeda': instance.moeda,
      'vlFaturacao': instance.vlFaturacao,
      'vlFinancero': instance.vlFinancero,
    };
