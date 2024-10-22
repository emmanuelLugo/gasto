// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filial _$FilialFromJson(Map<String, dynamic> json) => Filial(
      id: (json['id'] as num?)?.toInt(),
      codigo: (json['codigo'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      ruc: json['ruc'] as String?,
      cidade: json['cidade'] as String?,
      endereco: json['endereco'] as String?,
      ativo: json['ativo'] as bool?,
      principal: json['principal'] as String?,
    );

Map<String, dynamic> _$FilialToJson(Filial instance) => <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'ruc': instance.ruc,
      'cidade': instance.cidade,
      'endereco': instance.endereco,
      'ativo': instance.ativo,
      'principal': instance.principal,
    };
