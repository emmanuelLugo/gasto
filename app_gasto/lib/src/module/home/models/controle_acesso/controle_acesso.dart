import 'package:app_gasto/src/module/home/models/usuario/usuario_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'grupo_controle_acesso.dart';

part 'controle_acesso.g.dart';

@JsonSerializable()
class ControleAcesso {
  int? id;
  UsuarioDto? usuarioVO;
  GrupoControleAcesso? grupo;

  ControleAcesso({
    this.id,
    this.usuarioVO,
    this.grupo,
  });

  factory ControleAcesso.fromJson(Map<String, dynamic> json) =>
      _$ControleAcessoFromJson(json);
  Map<String, dynamic> toJson() => _$ControleAcessoToJson(this);
}
