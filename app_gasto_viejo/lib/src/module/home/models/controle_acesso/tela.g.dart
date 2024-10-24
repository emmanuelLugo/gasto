// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tela.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tela _$TelaFromJson(Map<String, dynamic> json) => Tela(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      codigo: json['codigo'] as String?,
    );

Map<String, dynamic> _$TelaToJson(Tela instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'codigo': instance.codigo,
    };
