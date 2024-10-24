import 'package:json_annotation/json_annotation.dart';

import 'package:app_gasto/src/module/login/models/permissao.dart';
import 'package:app_gasto/src/module/login/models/usuario.dart';

part 'usuario_item_permissao.g.dart';

@JsonSerializable()
class UsuarioItemPermissao {
  int? id;
  Usuario? usuario;
  Permissao? permissao;

  UsuarioItemPermissao({
    this.id,
    this.usuario,
    this.permissao,
  });

  factory UsuarioItemPermissao.fromJson(Map<String, dynamic> json) =>
      _$UsuarioItemPermissaoFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioItemPermissaoToJson(this);
}
