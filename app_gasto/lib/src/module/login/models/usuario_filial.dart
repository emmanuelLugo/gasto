import 'package:app_venda/src/module/login/models/usuario.dart';
import 'package:mobx/mobx.dart';

import 'filial.dart';

class UsuarioFilial {
  int? id;
  @observable
  Filial? filial;
  @observable
  Usuario? usuario;

  UsuarioFilial({
    this.id,
    this.filial,
    this.usuario,
  });

  UsuarioFilial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filial =
        (json['filial'] != null ? Filial.fromJson(json['filial']) : Filial());

    usuario = (json['usuario'] != null
        ? Usuario.fromJson(json['usuario'])
        : Usuario());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (filial != null) {
      data['filial'] = filial!.toJson();
    }
    if (usuario != null) {
      data['usuario'] = usuario!.toJson();
    }
    return data;
  }
}
