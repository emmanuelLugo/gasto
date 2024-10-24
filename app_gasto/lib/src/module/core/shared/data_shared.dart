import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/login/models/empresa.dart';
import 'package:app_gasto/src/module/login/models/filial.dart';
import 'package:app_gasto/src/module/login/models/moeda.dart';
import 'package:app_gasto/src/module/login/models/usuario.dart';

class DataShared {
  Usuario? usuario;
  Empresa? empresa;
  Filial? filial;

  List<Moeda>? moedasDisponiveis;
  List<Caixa>? caixasAbertas;

  int idMoedaBase = 1;
  Moeda? moedaBase = Moeda(id: 1);
  String? bocaFaturacao;
  String? filialFaturacao;

  get getPrecicaoMoeda => idMoedaBase == 1 ? 0 : 2;

  String resolveSimboloBymoeda() {
    if (idMoedaBase == 2) {
      return r'US$:';
    }
    if (idMoedaBase == 3) {
      return r'RS$:';
    }
    return r'GS$:';
  }

  String? versaoApp;

  void clear() {
    usuario = null;
    //vendedor = null;
  }
}
