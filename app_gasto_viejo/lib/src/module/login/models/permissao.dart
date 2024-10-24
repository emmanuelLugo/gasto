import 'package:json_annotation/json_annotation.dart';

part 'permissao.g.dart';

@JsonSerializable()
class Permissao {
  int? id;
  String? codigo;
  String? descricao;
  String? observacao;

  Permissao({
    this.id,
    this.codigo,
    this.descricao,
    this.observacao,
  });

  factory Permissao.fromJson(Map<String, dynamic> json) =>
      _$PermissaoFromJson(json);
  Map<String, dynamic> toJson() => _$PermissaoToJson(this);
}
