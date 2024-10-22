// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controle_acesso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControleAcesso _$ControleAcessoFromJson(Map<String, dynamic> json) =>
    ControleAcesso(
      id: (json['id'] as num?)?.toInt(),
      usuarioVO: json['usuarioVO'] == null
          ? null
          : UsuarioDto.fromJson(json['usuarioVO'] as Map<String, dynamic>),
      grupo: json['grupo'] == null
          ? null
          : GrupoControleAcesso.fromJson(json['grupo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ControleAcessoToJson(ControleAcesso instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuarioVO': instance.usuarioVO,
      'grupo': instance.grupo,
    };
