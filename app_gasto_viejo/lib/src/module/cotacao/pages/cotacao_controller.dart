import 'package:app_venda/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/cotacao/cotacao_repository.dart';
import 'package:app_venda/src/module/cotacao/models/cotacao/cotacao.dart';
import 'package:app_venda/src/module/cotacao/models/cotacao/item_cotacao.dart';
import 'package:app_venda/src/module/login/models/moeda.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cotacao_controller.g.dart';

enum CotacaoStatusState {
  loading,
  loaded,
  error,
}

class CotacaoController = CotacaoControllerBase with _$CotacaoController;

abstract class CotacaoControllerBase with Store {
  final CotacaoRepository repository;
  final DataShared dataShared;

  CotacaoControllerBase(this.repository, this.dataShared);

  @observable
  Cotacao novaCotacao = Cotacao();

  @observable
  Cotacao cotacao = Cotacao();

  @observable
  bool isCarregaCotacao = false;

  @observable
  ObservableList<ItemCotacao> cotacoes = ObservableList();

  @observable
  String message = '';

  @readonly
  CotacaoStatusState _status = CotacaoStatusState.loaded;

  @action
  Future<void> findUltimaCotacao() async {
    try {
      _status = CotacaoStatusState.loading;
      final cotacaoAtual = await repository.findCotacaoAtual();
      cotacao = cotacaoAtual!.copyWith();
      cotacoes = cotacao.itens!.asObservable();
      dataShared.cotacao = cotacaoAtual;
      _status = CotacaoStatusState.loaded;
    } on RepositoryException catch (e) {
      message = e.message ?? 'error al cargar la cotizacion';
      _status = CotacaoStatusState.error;
    }
  }

  @action
  Future<void> save() async {
    novaCotacao.itens = cotacoes;
    // if (!novaCotacao.isValido()) {}
    return await repository.save(novaCotacao).then(
      (value) {
        cotacao = value!;
        //  Alert.show('cotización actualizada', Alert.SUCCESS, size: Alert.MEDIUM);
        return value;
      },
    );
  }

  @action
  void trocaMoedaEstado(ItemCotacao item, bool value) {
    // item.isAtivo = value;
    // item.vlFaturacao = 0.0;
    // item.vlFinancero = 0.0;
  }

  @action
  double converteVlFaturacao(double valor, int idMoeda) {
    ItemCotacao item = cotacoes.first;
    for (var i = 0; i < cotacoes.length; i++) {
      if (cotacoes[i].moeda!.id == idMoeda) {
        item = cotacoes[i];
      }
    }
    //  = cotacoes.firstWhere((e) => e.moeda!.id == idMoeda,
    //     orElse: () => ItemCotacao());

    //Se ha moeda base for guarani
    if (dataShared.moedaBase!.id == 1) {
      if (item.id != null) {
        if (idMoeda == 1) {
          return valor;
        } else {
          return valor * item.vlFaturacao;
        }
      } else {
        return valor;
      }
    }

    //Se ha moeda base for real
    if (dataShared.moedaBase!.id == 2) {
      if (item.id != null) {
        if (idMoeda == 2) {
          return valor;
        } else if (idMoeda == 3) {
          return valor / item.vlFaturacao;
        } else {
          return valor * item.vlFaturacao;
        }
      } else {
        return valor;
      }
    }

    //Se ha moeda base for dolar
    if (dataShared.moedaBase!.id == 3) {
      if (item.id != null) {
        if (idMoeda == 3) {
          return valor;
        } else {
          return valor / item.vlFaturacao;
        }
      } else {
        return valor;
      }
    }
    return 0;
  }

  @action
  double converteVlAMoedaCotacao(double valor, int idMoeda) {
    final ItemCotacao item = cotacoes.firstWhere((e) => e.moeda!.id == idMoeda,
        orElse: () => ItemCotacao());

    //Se ha moeda base for guarani
    if (dataShared.moedaBase!.id == 1) {
      if (item.id != null) {
        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }

    //Se ha moeda base for real
    if (dataShared.moedaBase!.id == 2) {
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

    //Se ha moeda base for dolar
    if (dataShared.moedaBase!.id == 3) {
      if (item.id != null) {
        if (idMoeda == 1) {
          return valor * item.vlFaturacao;
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

  double converteValorRecebimentoAMoedaBase({
    required double valor,
    required int idMoedaEntrada,
  }) {
    final ItemCotacao item = cotacoes.firstWhere(
        (e) => e.moeda!.id == idMoedaEntrada,
        orElse: () => ItemCotacao());

    if (dataShared.moedaBase!.id == 1) {
      switch (idMoedaEntrada) {
        case 1:
          return valor;
        case 2:
          return valor * item.vlFaturacao;
        case 3:
          return valor * item.vlFaturacao;
        case 4:
          return valor / item.vlFaturacao;
        default:
          return valor;
      }
    } else if (dataShared.moedaBase!.id == 2) {
      switch (idMoedaEntrada) {
        case 1:
          return valor / item.vlFaturacao;
        case 2:
          return valor;
        case 3:
          return valor * item.vlFaturacao;
        case 4:
          return valor * item.vlFaturacao;
        default:
          return valor;
      }
    } else if (dataShared.moedaBase!.id == 3) {
      switch (idMoedaEntrada) {
        case 1:
          return valor / item.vlFaturacao;
        case 2:
          return valor / item.vlFaturacao;
        case 3:
          return valor;
        case 4:
          valor;
          return valor / item.vlFaturacao;
        default:
          return valor;
      }
    } else {
      switch (idMoedaEntrada) {
        case 1:
          return valor * item.vlFaturacao;
        case 2:
          return valor * item.vlFaturacao;
        case 3:
          return valor * item.vlFaturacao;
        case 4:
          return valor;
        default:
          return valor * item.vlFaturacao;
      }
    }
  }

  @action
  double converteVlTotaVenta(double valor, int idMoeda) {
    final ItemCotacao item = cotacoes.firstWhere((e) => e.moeda!.id == idMoeda,
        orElse: () => ItemCotacao());

    //Se ha moeda base for guarani
    if (dataShared.moedaBase!.id == 1) {
      if (item.id != null) {
        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }

    //Se ha moeda base for real
    if (dataShared.moedaBase!.id == 2) {
      if (item.id != null) {
        if (item.moeda!.id == 1 || item.moeda!.id == 4) {
          return valor * item.vlFaturacao;
        } else {
          return valor / item.vlFaturacao;
        }
      } else {
        return valor;
      }
    }

    //Se ha moeda base for dolar
    if (dataShared.moedaBase!.id == 3) {
      if (item.id != null) {
        return valor * item.vlFaturacao;
      }
    }
    return 0;
  }

  @action
  String converteVlFaturacaoEFormatado(double valor, int idMoeda) {
    return formatNumber(converteVlAMoedaCotacao(valor, idMoeda), idMoeda);
  }

  Moeda getMoedaBase() {
    if (dataShared.moedaBase == null) {
      return Moeda(id: 1, descricao: 'GUARANI');
    }
    return dataShared.moedaBase!;
  }

  String getMoedaBaseSymbol() {
    var symbol = '';

    try {
      // symbol = _dataShared.moedaBase!.symbol;
      symbol = 'GGG';
    } catch (e) {
      debugPrint(e.toString());
    }

    return symbol;
  }

  @action
  double converteVlRecebimentoAMoedaBase(double valor, int idMoeda) {
    //Se hasda moeda base for guarani
    final ItemCotacao item = cotacoes.firstWhere(
      (e) => e.moeda!.id == idMoeda,
      orElse: () => ItemCotacao(),
    );

    //Se ha moeda base for guarani
    if (dataShared.moedaBase!.id == 1) {
      if (item.id != null) {
        return valor / item.vlFaturacao;
      } else {
        return valor;
      }
    }
    //Se ha moeda base for real
    if (dataShared.moedaBase!.id == 2) {
      if (item.id != null) {
        if (item.moeda!.id == 1 || item.moeda!.id == 4) {
          return valor * item.vlFaturacao;
        } else {
          return valor / item.vlFaturacao;
        }
      } else {
        return valor;
      }
    }
    if (dataShared.moedaBase!.id == 3) {
      return valor * item.vlFaturacao;
    }
    if (dataShared.moedaBase!.id == 4) {
      return valor * item.vlFaturacao;
    }
    return 0;
  }

  @action
  String converteAMoedaBase(double valor) {
    return formatNumber(valor, dataShared.idMoedaBase);
  }

  @action
  int moedaBasePrecision() {
    int precision;
    if (dataShared.moedaBase!.id == 1) {
      precision = 0;
    } else {
      precision = 2;
    }
    return precision;
  }

  List<Moeda> findMoedasAtivas() {
    final List<Moeda> moedas = [];
    moedas.add(dataShared.moedaBase!);

    // for (var item in cotacoes) {
    //   if (item.isAtivo) moedas.add(item.moeda!);
    // }

    return moedas;
  }
}
