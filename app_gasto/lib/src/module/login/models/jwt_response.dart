import 'package:app_gasto/src/module/login/models/empresa.dart';
import 'package:app_gasto/src/module/login/models/licencia.dart';
import 'package:app_gasto/src/module/login/models/usuario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jwt_response.g.dart';

@JsonSerializable()
class JwtResponse {
  String? jwttoken;
  Usuario usuario;
  Empresa? empresa;
  Licencia? licencia;

  JwtResponse({
    required this.jwttoken,
    required this.usuario,
    this.empresa,
    this.licencia,
  });

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JwtResponseToJson(this);
}
