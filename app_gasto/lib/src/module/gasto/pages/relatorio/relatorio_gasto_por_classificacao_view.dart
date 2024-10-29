import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/relatorio_gasto_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class RelatorioGastoPorClassificacaoView extends StatefulWidget {
  const RelatorioGastoPorClassificacaoView({super.key});

  @override
  State<RelatorioGastoPorClassificacaoView> createState() =>
      _RelatorioGastoPorClassificacaoViewState();
}

class _RelatorioGastoPorClassificacaoViewState
    extends State<RelatorioGastoPorClassificacaoView>
    with Loader, SnackbarManager {
  final _gastoController = Modular.get<RelatorioGastoController>();
  late ReactionDisposer statusReactionDisposer;
  final _caixaDelegateController = Modular.get<CaixaDelegateController>();
  final _descricaoEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _gastoController.initGasto();
    _initReaction();
    _consultaCaixaCarregada();
  }

  void _consultaCaixaCarregada() {
    if (_gastoController.caixaSelecionada != null) {
      _descricaoEC.text = _gastoController.caixaSelecionada!.observacao ?? '';
      _gastoController.findTotalGastoPorClassificacaoByCaixa(
          _gastoController.caixaSelecionada!.id!);
    }
  }

  @override
  void dispose() {
    statusReactionDisposer();
    _descricaoEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte Gastos'),
      ),
      persistentFooterButtons: [
        _buildPersistentFooter(),
      ],
      body: RelatorioGastoBodyWidget(
        caixaDelegateController: _caixaDelegateController,
        gastoController: _gastoController,
        descricaoEC: _descricaoEC,
        title: 'Distribución de Gastos por Clasificación',
        onCaixaSelected: (value) {
          _gastoController.setCaixaSelecionada(value!);
          _gastoController.findTotalGastoPorClassificacaoByCaixa(value.id!);
        },
        consultaClassificacao: true,
      ),
    );
  }

  Widget _buildPersistentFooter() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Observer(
        builder: (_) {
          return Text(
            'Total Gasto: ${formatCurrency(_gastoController.vlTotal, 1)}',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }

  void _initReaction() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        statusReactionDisposer = reaction(
          (_) => _gastoController.status,
          (status) {
            switch (status) {
              case RelatorioGastoStatusState.initial:
                hideLoader();
                break;
              case RelatorioGastoStatusState.loaded:
                hideLoader();
                break;
              case RelatorioGastoStatusState.loading:
                showLoader();
                break;
              case RelatorioGastoStatusState.success:
                hideLoader();
                showSuccess(_gastoController.message);
                break;
              case RelatorioGastoStatusState.error:
                hideLoader();
                showError(_gastoController.message);
                break;
              default:
            }
          },
        );
      },
    );
  }
}
