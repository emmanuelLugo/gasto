// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_controle_acesso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrupoControleAcesso _$GrupoControleAcessoFromJson(Map<String, dynamic> json) =>
    GrupoControleAcesso(
      id: (json['id'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      itens: (json['itens'] as List<dynamic>?)
          ?.map((e) => ItemGrupo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GrupoControleAcessoToJson(
        GrupoControleAcesso instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'itens': instance.itens,
    };
