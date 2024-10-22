import 'package:json_annotation/json_annotation.dart';

part 'filial.g.dart';

@JsonSerializable()
class Filial {
  int? id;
  int? codigo;
  String? descricao;
  String? ruc;
  String? cidade;
  String? endereco;
  bool? ativo;
  String? principal;
  Filial({
    this.id,
    this.codigo,
    this.descricao,
    this.ruc,
    this.cidade,
    this.endereco,
    this.ativo,
    this.principal,
  });

  Filial copyWith({
    int? id,
    int? codigo,
    String? descricao,
    String? ruc,
    String? cidade,
    String? endereco,
    bool? ativo,
    String? principal,
    String? empresa,
  }) {
    return Filial(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      ruc: ruc ?? this.ruc,
      cidade: cidade ?? this.cidade,
      endereco: endereco ?? this.endereco,
      ativo: ativo ?? this.ativo,
      principal: principal ?? this.principal,
    );
  }

  factory Filial.fromJson(Map<String, dynamic> json) => _$FilialFromJson(json);
  Map<String, dynamic> toJson() => _$FilialToJson(this);

  @override
  String toString() {
    return 'Filial(id: $id, codigo: $codigo, descricao: $descricao, ruc: $ruc, cidade: $cidade, endereco: $endereco, ativo: $ativo, principal: $principal)';
  }

  @override
  bool operator ==(covariant Filial other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.codigo == codigo &&
        other.descricao == descricao &&
        other.ruc == ruc &&
        other.cidade == cidade &&
        other.endereco == endereco &&
        other.ativo == ativo &&
        other.principal == principal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        codigo.hashCode ^
        descricao.hashCode ^
        ruc.hashCode ^
        cidade.hashCode ^
        endereco.hashCode ^
        ativo.hashCode ^
        principal.hashCode;
  }
}
