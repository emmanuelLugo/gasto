// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parametros.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parametros _$ParametrosFromJson(Map<String, dynamic> json) => Parametros(
      parametro: json['parametro'] as String?,
      valor: json['valor'] as String?,
      valor_alternativo: json['valor_alternativo'] as String?,
    );

Map<String, dynamic> _$ParametrosToJson(Parametros instance) =>
    <String, dynamic>{
      'parametro': instance.parametro,
      'valor': instance.valor,
      'valor_alternativo': instance.valor_alternativo,
    };
