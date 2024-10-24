// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_grupo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemGrupo _$ItemGrupoFromJson(Map<String, dynamic> json) => ItemGrupo(
      id: (json['id'] as num?)?.toInt(),
      tela: json['tela'] == null
          ? null
          : Tela.fromJson(json['tela'] as Map<String, dynamic>),
      grupo: json['grupo'] == null
          ? null
          : GrupoControleAcesso.fromJson(json['grupo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemGrupoToJson(ItemGrupo instance) => <String, dynamic>{
      'id': instance.id,
      'tela': instance.tela,
      'grupo': instance.grupo,
    };
