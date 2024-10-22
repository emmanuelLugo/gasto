// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pessoa _$PessoaFromJson(Map<String, dynamic> json) => Pessoa(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      ruc: json['ruc'] as String?,
      ativo: json['ativo'] as bool?,
      localizacao: json['localizacao'] as String?,
      observacao: json['observacao'] as String?,
      telefone: json['telefone'] as String?,
    );

Map<String, dynamic> _$PessoaToJson(Pessoa instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'ruc': instance.ruc,
      'ativo': instance.ativo,
      'localizacao': instance.localizacao,
      'observacao': instance.observacao,
      'telefone': instance.telefone,
    };
