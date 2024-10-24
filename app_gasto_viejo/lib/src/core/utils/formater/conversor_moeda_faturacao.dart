import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/cotacao/models/cotacao/item_cotacao.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConversorMoedaFaturacao {
  final DataShared _dataShared = Modular.get();

  //el valor que se mete en este metodo si o si es el valor en moneda base

  // por ejemplo si mi moneda bas es real y pongo el valor 5.. lo que va a hacer es convertir mi 5 reales a otra moneda
  // lo que necesito es que no importa la moneda, quiero que me convierta 5 reales a otra moneda
  double converteDeMoedaBaseAOutros(
      {required double valor, required int idMoeda}) {
    final ItemCotacao item = _dataShared.cotacao!.itens!
        .firstWhere((e) => e.moeda!.id == idMoeda, orElse: () => ItemCotacao());

    if (_dataShared.idMoedaBase == 1) {
      if (item.id != null) {
        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }

    if (_dataShared.idMoedaBase == 2) {
      if (item.id != null) {
        if (idMoeda == 1) {
          return valor * item.vlFaturacao;
        } else if (idMoeda == 2) {
          return valor;
        } else if (idMoeda == 3) {
          return valor / item.vlFaturacao;
        }

        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }

    if (_dataShared.idMoedaBase == 3) {
      if (item.id != null) {
        if (idMoeda == 1) {
          return valor * item.vlFaturacao;
        } else if (idMoeda == 2) {
          return valor / item.vlFaturacao;
        } else if (idMoeda == 3) {
          return valor;
        }

        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }

    return 0.0;
  }

  double converteVlAMoedaCotacao(
      {required double valor, required int idMoeda}) {
    final ItemCotacao item = _dataShared.cotacao!.itens!
        .firstWhere((e) => e.moeda!.id == idMoeda, orElse: () => ItemCotacao());

    if (_dataShared.idMoedaBase == 1) {
      if (item.id != null) {
        if (idMoeda == 1) {
          return valor;
        } else if (idMoeda == 2) {
          return valor * item.vlFaturacao;
        } else if (idMoeda == 3) {
          return valor * item.vlFaturacao;
        }
      } else {
        return valor;
      }
    }

    if (_dataShared.idMoedaBase == 2) {
      if (item.id != null) {
        if (idMoeda == 1) {
          return valor * item.vlFaturacao;
        } else if (idMoeda == 2) {
          return valor;
        } else if (idMoeda == 3) {
          return valor / item.vlFaturacao;
        }

        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }

    if (_dataShared.idMoedaBase == 3) {
      if (item.id != null) {
        if (idMoeda == 1) {
          return valor / item.vlFaturacao;
        } else if (idMoeda == 2) {
          return valor * item.vlFaturacao;
        } else if (idMoeda == 3) {
          return valor;
        }

        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }
    return 0;
  }
}
