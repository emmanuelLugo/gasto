import 'package:app_venda/src/core/components/banderas/bandeiras.dart';
import 'package:app_venda/src/core/components/behahavior/custom_scroll_behavior.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/cotacao/pages/cotacao_controller.dart';
import 'package:app_venda/src/module/cotacao/pages/widgets/divisas_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class CotacaoPage extends StatefulWidget {
  final String title;
  const CotacaoPage({
    super.key,
    this.title = "Cotización",
  });

  @override
  CotacaoPageState createState() => CotacaoPageState();
}

class CotacaoPageState extends State<CotacaoPage> with SnackbarManager, Loader {
  final controller = Modular.get<CotacaoController>();
  final dataShared = Modular.get<DataShared>();

  late ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.findUltimaCotacao();
    });
    reactionInitializer();
    super.initState();
  }

  void reactionInitializer() {
    statusReactionDisposer = reaction(
      (_) => controller.status,
      (status) {
        switch (status) {
          case CotacaoStatusState.loaded:
            hideLoader();
            break;
          case CotacaoStatusState.loading:
            showLoader();
            break;
          case CotacaoStatusState.error:
            hideLoader();
            showError(controller.message);
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotización'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Observer(
          builder: (_) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: ScrollConfiguration(
                  behavior: CustomScollBehavior(),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          _moedaBase(),
                          const Divider(),
                          _titulo(),
                          for (var item in controller.cotacoes)
                            Observer(
                              builder: (_) {
                                return DivisasWidget(
                                  item: item,
                                  idMoedaBase:
                                      controller.dataShared.idMoedaBase,
                                  moedaBase: controller.dataShared.moedaBase!,
                                  cotacaoController: controller,
                                );
                              },
                            ),
                          _actualizado(),
                          _info(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => _save(),
      ),
    );
  }

  void _save() async {
    await controller.save();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget _titulo() {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 48,
        ),
        Expanded(
          child: Text(
            'Facturación',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black87, fontSize: 20),
          ),
        ),
        Expanded(
          child: Text(
            'Financiero',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black87, fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget _info() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        '*La cotización del tipo FACTURACIÓN afecta la venta, la cotización del tipo FINANCIERO las compras*',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.black87, fontSize: 12),
      ),
    );
  }

  Widget _moedaBase() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'MONEDA BASE',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black87, fontSize: 20.0),
        ),
        const SizedBox(
          width: 15,
        ),
        Bandeiras.banderaById(controller.dataShared.idMoedaBase)
      ],
    );
  }

  Widget _actualizado() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: 425,
      alignment: Alignment.center,
      // child: Text(
      //   'Actualizado: ${formatDate(controller.cotacao.dtCotacao)} ${formatHour(controller.cotacao.dtCotacao)}',
      //   // 'Actualizado: ${dateFormatter.format(DateTime.parse(widget.controller.cotacao.dtCotacao))} ${hourFormatter.format(DateTime.parse(widget.controller.cotacao.dtCotacao))}',
      //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      //         color: Colors.black87,
      //       ),
      // ),
    );
  }
}
