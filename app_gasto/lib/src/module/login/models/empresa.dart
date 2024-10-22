import 'package:json_annotation/json_annotation.dart';

part 'empresa.g.dart';

@JsonSerializable()
class Empresa {
  int? id;
  String? descricao;
  String? urlFoto;

  Empresa({
    this.id,
    this.descricao,
    this.urlFoto,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) =>
      _$EmpresaFromJson(json);
  Map<String, dynamic> toJson() => _$EmpresaToJson(this);
}
