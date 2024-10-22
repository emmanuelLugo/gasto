// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_gasto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoGasto _$TipoGastoFromJson(Map<String, dynamic> json) => TipoGasto(
      id: (json['id'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
    );

Map<String, dynamic> _$TipoGastoToJson(TipoGasto instance) => <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
    };
