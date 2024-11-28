import 'package:app_gasto/src/module/gasto/models/tipo_gasto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'classificacao_gasto.g.dart';

@JsonSerializable()
class ClassificacaoGasto {
  int? id;
  String? descricao;
  bool? ativo;
  TipoGasto? tipoGasto;

  ClassificacaoGasto({
    this.id,
    this.descricao,
    this.ativo,
    this.tipoGasto,
  });

  ClassificacaoGasto copyWith({
    int? id,
    String? descricao,
    bool? ativo,
    TipoGasto? tipoGasto,
  }) {
    return ClassificacaoGasto(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      ativo: ativo ?? this.ativo,
      tipoGasto: tipoGasto ?? this.tipoGasto,
    );
  }

  factory ClassificacaoGasto.fromJson(Map<String, dynamic> json) => _$ClassificacaoGastoFromJson(json);
  Map<String, dynamic> toJson() => _$ClassificacaoGastoToJson(this);

  ClassificacaoGasto.novo() {
    id = null;
    descricao = '';
    ativo = true;
  }

  String status() {
    switch (ativo) {
      case true:
        return 'Activo';
      case false:
        return 'Inactivo';
      default:
        ativo = true;
        return 'Activo';
    }
  }
}
