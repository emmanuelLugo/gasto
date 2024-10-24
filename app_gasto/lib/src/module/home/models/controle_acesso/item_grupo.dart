import 'package:app_gasto/src/module/home/models/controle_acesso/tela.dart';
import 'package:json_annotation/json_annotation.dart';

import 'grupo_controle_acesso.dart';

part 'item_grupo.g.dart';

@JsonSerializable()
class ItemGrupo {
  int? id;
  Tela? tela;

  GrupoControleAcesso? grupo;
  ItemGrupo({
    this.id,
    this.tela,
    this.grupo,
  });

  factory ItemGrupo.fromJson(Map<String, dynamic> json) =>
      _$ItemGrupoFromJson(json);
  Map<String, dynamic> toJson() => _$ItemGrupoToJson(this);
}
