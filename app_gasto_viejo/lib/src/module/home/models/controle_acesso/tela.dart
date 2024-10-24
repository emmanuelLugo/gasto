import 'package:json_annotation/json_annotation.dart';

part 'tela.g.dart';

@JsonSerializable()
class Tela {
  int? id;
  String? nome;
  String? codigo;

  Tela({
    this.id,
    this.nome,
    this.codigo,
  });

  factory Tela.fromJson(Map<String, dynamic> json) => _$TelaFromJson(json);
  Map<String, dynamic> toJson() => _$TelaToJson(this);
}
