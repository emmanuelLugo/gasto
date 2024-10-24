class Licencia {
  int? id;
  String? serie;
  bool? ativo;
  String? fechaUltimoLogin;
  String? dtExpiracao;
  String? dtExpiracaoString;
  bool? programacao;
  int? diasAVencer;

  Licencia({
    this.id,
    this.serie,
    this.ativo,
    this.fechaUltimoLogin,
    this.dtExpiracao,
    this.dtExpiracaoString,
    this.programacao,
    this.diasAVencer,
  });

  Licencia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serie = json['serie'];
    ativo = json['ativo'];
    fechaUltimoLogin = json['fechaUltimoLogin'];
    dtExpiracao = json['dtExpiracao'];
    dtExpiracaoString = json['dtExpiracaoString'];
    programacao = json['programacao'];
    diasAVencer = json['diasAVencer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serie'] = serie;
    data['ativo'] = ativo;
    data['fechaUltimoLogin'] = fechaUltimoLogin;
    data['dtExpiracao'] = dtExpiracao;
    data['dtExpiracaoString'] = dtExpiracaoString;
    data['programacao'] = programacao;
    data['diasAVencer'] = diasAVencer;
    return data;
  }

  Licencia copyWith({
    int? id,
    String? serie,
    bool? ativo,
    String? fechaUltimoLogin,
    String? dtExpiracao,
    String? dtExpiracaoString,
    bool? programacao,
    int? diasAVencer,
  }) {
    return Licencia(
      id: id ?? this.id,
      serie: serie ?? this.serie,
      ativo: ativo ?? this.ativo,
      fechaUltimoLogin: fechaUltimoLogin ?? this.fechaUltimoLogin,
      dtExpiracao: dtExpiracao ?? this.dtExpiracao,
      dtExpiracaoString: dtExpiracaoString ?? this.dtExpiracaoString,
      programacao: programacao ?? this.programacao,
      diasAVencer: diasAVencer ?? this.diasAVencer,
    );
  }
}
