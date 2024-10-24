import 'package:json_annotation/json_annotation.dart';

part 'tipo_gasto.g.dart';

@JsonSerializable()
class TipoGasto {
  int? id;
  String? descricao;

  TipoGasto({
    this.id,
    this.descricao,
  });

  factory TipoGasto.fromJson(Map<String, dynamic> json) =>
      _$TipoGastoFromJson(json);
  Map<String, dynamic> toJson() => _$TipoGastoToJson(this);
}
