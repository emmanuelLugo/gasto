// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtResponse _$JwtResponseFromJson(Map<String, dynamic> json) => JwtResponse(
      jwttoken: json['jwttoken'] as String?,
      usuario: Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
      empresa: json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>),
      licencia: json['licencia'] == null
          ? null
          : Licencia.fromJson(json['licencia'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JwtResponseToJson(JwtResponse instance) =>
    <String, dynamic>{
      'jwttoken': instance.jwttoken,
      'usuario': instance.usuario,
      'empresa': instance.empresa,
      'licencia': instance.licencia,
    };
