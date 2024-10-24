import 'package:app_venda/src/core/exceptions/exception_utils.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/core/shared/parametros_shared.dart';
import 'package:app_venda/src/module/core/shared/telas_shared.dart';
import 'package:app_venda/src/module/cotacao/cotacao_repository.dart';
import 'package:app_venda/src/module/cotacao/models/cotacao/cotacao.dart';
import 'package:app_venda/src/module/home/models/parametro/parametros.dart';
import 'package:app_venda/src/module/home/repositories/controle_acesso_repository.dart';
import 'package:app_venda/src/module/home/repositories/parametro_repository.dart';
import 'package:app_venda/src/module/login/models/moeda.dart';

class ConfiguracaoSistemaService {
  final TelasShared _telasShared;
  final DataShared _dataShared;
  final ParametrosShared _parametrosShared;
  final CotacaoRepository _cotacaoRepository;
  final ParametroRepository _parametroRepository;
  final ControleAcessoRepository _controleAcessoRepository;

  ConfiguracaoSistemaService(
    this._dataShared,
    this._cotacaoRepository,
    this._parametroRepository,
    this._parametrosShared,
    this._controleAcessoRepository,
    this._telasShared,
  );

  Future<void> consultaParametros() async {
    try {
      final parametros = await Future.wait([
        findParametro('MOEDA_BASE_VENDA'),
        findParametro('NOME_EMPRESA'),
        findParametro('INFO_EMPRESA'),
        findParametro('ID_MOEDA_BASE'),
      ]);

      _parametrosShared.moedaBaseVenda = parametros[0];
      _parametrosShared.nomeEmpresa = parametros[1];
      _parametrosShared.infoEmpresa = parametros[2];
      _parametrosShared.idMoedaBase = parametros[3];
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<void> findControleAcessoByUsuario() async {
    final response =
        await _controleAcessoRepository.findControleAcessoByUsuario();

    for (var item in response.grupo!.itens!) {
      switch (item.tela!.codigo) {
        case 'PESSOA':
          _telasShared.habilitaPessoa = true;
          break;
        case 'PRODUTO_FOTOS':
          _telasShared.habilitaProdutoFotos = true;
          break;
        case 'RECEBIMENTO_PARCELAS':
          _telasShared.habilitaCobroCuota = true;
          break;
        case 'GASTO':
          _telasShared.habilitaGasto = true;
          break;
        case 'CIDADE':
          _telasShared.habilitaCidade = true;
          break;
        case 'CANAIS':
          _telasShared.habilitaCanais = true;
          break;
      }
    }
  }

  Future<void> consultaCotacaoAtual() async {
    try {
      final response = await _cotacaoRepository.findCotacaoAtual();
      if (response != null) {
        _dataShared.cotacao = response;
        consultaMoedasDisponiveisByCotacao(response);
      }
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  consultaMoedasDisponiveisByCotacao(Cotacao cotacao) async {
    final Set<Moeda> monedasDisponibles = {};
    monedasDisponibles.add(Moeda.moedaById(_dataShared.idMoedaBase));

    final itensCotacao = cotacao.itens;
    if (itensCotacao != null && itensCotacao.isNotEmpty) {
      for (var item in itensCotacao) {
        if (item.moeda != null && item.moeda!.id != _dataShared.idMoedaBase) {
          monedasDisponibles.add(item.moeda!);
        }
      }
    }

    final List<Moeda> moedasDisponiveis = monedasDisponibles.toList();
    _dataShared.moedasDisponiveis = moedasDisponiveis;
  }

  Future<Parametros> findParametro(String parametro) async {
    try {
      return await _parametroRepository.findParametro(parametro);
    } on RepositoryException {
      throw ServiceException(
          message: ExceptionUtils.getExceptionMessage(
              'Parametro $parametro no configurado'));
    }
  }

  void configuraIdMoedaPadrao() {
    if (_parametrosShared.moedaBaseVenda?.valor == 'GUARANI') {
      _dataShared.idMoedaBase = 1;
      _dataShared.moedaBase = Moeda.moedaById(1);
    } else if (_parametrosShared.moedaBaseVenda?.valor == 'DOLAR') {
      _dataShared.idMoedaBase = 2;
      _dataShared.moedaBase = Moeda.moedaById(2);
    } else {
      _dataShared.idMoedaBase = 3;
      _dataShared.moedaBase = Moeda.moedaById(3);
    }
  }
}
