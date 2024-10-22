import 'package:json_annotation/json_annotation.dart';

part 'moeda.g.dart';

@JsonSerializable()
class Moeda {
  int? id;
  String? descricao;
  int? precisao;

  Moeda({
    this.id,
    this.descricao,
    this.precisao,
  });

  static List<Moeda> moedas() {
    final List<Moeda> moedas = [];
    moedas.add(Moeda(id: 1, descricao: 'GUARANI(ES)', precisao: 0));
    moedas.add(Moeda(id: 2, descricao: 'DOLAR(ES)', precisao: 2));
    moedas.add(Moeda(id: 3, descricao: 'REAL(ES)', precisao: 2));

    return moedas;
  }

  static Moeda moedaById(int idMoeda) {
    if (idMoeda == 1) {
      return Moeda(id: 1, descricao: 'GUARANI(ES)', precisao: 0);
    }
    if (idMoeda == 2) {
      return Moeda(id: 2, descricao: 'DOLAR(ES)', precisao: 2);
    }
    if (idMoeda == 3) {
      return Moeda(id: 3, descricao: 'REAL(ES)', precisao: 2);
    }

    return Moeda(id: 1, descricao: 'GUARANI(ES)', precisao: 0);
  }

  factory Moeda.fromJson(Map<String, dynamic> json) => _$MoedaFromJson(json);
  Map<String, dynamic> toJson() => _$MoedaToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Moeda &&
        other.descricao == descricao &&
        other.id == id &&
        other.precisao == precisao;
  }

  @override
  int get hashCode => descricao.hashCode ^ id.hashCode;
}
