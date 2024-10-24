import 'package:app_gasto/src/core/models/i_simple_list_tile.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pessoa.g.dart';

@JsonSerializable()
class Pessoa implements ISimpleListTile {
  int? id;
  String? nome;
  String? ruc;
  bool? ativo;
  String? localizacao;
  String? observacao;
  String? telefone;

  Pessoa({
    this.id,
    this.nome,
    this.ruc,
    this.ativo,
    this.localizacao,
    this.observacao,
    this.telefone,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);
  Map<String, dynamic> toJson() => _$PessoaToJson(this);

  @override
  String get title => 'test';

  @override
  String? get subTitle => null;
}
