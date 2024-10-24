import 'package:json_annotation/json_annotation.dart';

import 'item_grupo.dart';

part 'grupo_controle_acesso.g.dart';

@JsonSerializable()
class GrupoControleAcesso {
  int? id;
  String? descricao;
  List<ItemGrupo>? itens;
  GrupoControleAcesso({
    this.id,
    this.descricao,
    this.itens,
  });

  factory GrupoControleAcesso.fromJson(Map<String, dynamic> json) =>
      _$GrupoControleAcessoFromJson(json);

  Map<String, dynamic> toJson() => _$GrupoControleAcessoToJson(this);
}
