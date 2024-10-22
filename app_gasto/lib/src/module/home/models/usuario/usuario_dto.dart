import 'package:json_annotation/json_annotation.dart';

part 'usuario_dto.g.dart';

@JsonSerializable()
class UsuarioDto {
  int? id;
  String? nome;
  String? login;
  bool? ativo;

  UsuarioDto({
    this.id,
    this.nome,
    this.login,
    this.ativo,
  });

  factory UsuarioDto.fromJson(Map<String, dynamic> json) =>
      _$UsuarioDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioDtoToJson(this);
}
