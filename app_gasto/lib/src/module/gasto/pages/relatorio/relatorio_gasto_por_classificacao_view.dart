import 'package:app_gasto/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/grafico_lineal_widget.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/grafico_pie_widget.dart';
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
  final _scrollController = ScrollController();
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
        title: const Text('Gastos'),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Observer(
            builder: (_) {
              return Text(
                'Total Gasto: ${formatCurrency(_gastoController.vlTotal, 1)}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ],
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: InputSeachDelegate<Caixa?>(
                label: 'Caja',
                searchDelegate: CaixaDelegate(_caixaDelegateController),
                controller: _descricaoEC,
                onSelected: (value) {
                  _descricaoEC.text = value?.observacao ?? '';
                  if (value != null) {
                    _gastoController
                        .findTotalGastoPorClassificacaoByCaixa(value.id!);
                    _gastoController.caixaSelecionada = value;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: context.screenHeight * 0.40,
              child: Observer(
                builder: (_) {
                  if (_gastoController.listDto.isEmpty) {
                    return const Center(
                      child: Text(
                        "No hay datos para mostrar",
                      ),
                    );
                  }
                  return GraficoPieWidget(
                      listDto: _gastoController.listDto,
                      title: 'Distribución de Gastos por Clasificación');
                },
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.40,
              child: Observer(
                builder: (_) {
                  if (_gastoController.caixaSelecionada == null) {
                    return const SizedBox.shrink();
                  }

                  return GraficoLinealWidget(
                    listDto: _gastoController.listDto,
                    gastoController: _gastoController,
                    caixa: _gastoController.caixaSelecionada!,
                  );
                },
              ),
            ),
          ],
        ),
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
