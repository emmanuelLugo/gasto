import 'package:json_annotation/json_annotation.dart';

part 'parametros.g.dart';

@JsonSerializable()
class Parametros {
  String? parametro;
  String? valor;
  String? valor_alternativo;

  Parametros({
    this.parametro,
    this.valor,
    this.valor_alternativo,
  });

  factory Parametros.fromJson(Map<String, dynamic> json) =>
      _$ParametrosFromJson(json);
  Map<String, dynamic> toJson() => _$ParametrosToJson(this);
}
