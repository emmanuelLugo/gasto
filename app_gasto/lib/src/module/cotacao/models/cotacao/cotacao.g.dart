// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cotacao _$CotacaoFromJson(Map<String, dynamic> json) => Cotacao(
      id: (json['id'] as num?)?.toInt(),
      dtCotacao: json['dtCotacao'] as String? ?? '',
      itens: (json['itens'] as List<dynamic>?)
          ?.map((e) => ItemCotacao.fromJson(e as Map<String, dynamic>))
          .toList(),
      usuario: json['usuario'] as String?,
    );

Map<String, dynamic> _$CotacaoToJson(Cotacao instance) => <String, dynamic>{
      'id': instance.id,
      'dtCotacao': instance.dtCotacao,
      'itens': instance.itens,
      'usuario': instance.usuario,
    };
