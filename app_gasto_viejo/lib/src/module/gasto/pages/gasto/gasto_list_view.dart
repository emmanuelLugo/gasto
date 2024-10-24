import 'package:app_venda/src/core/components/fields/date_form_input/date_formatted.dart';
import 'package:app_venda/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_venda/src/core/pagination/footer_pagination_bar.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_venda/src/module/gasto/models/gasto.dart';
import 'package:app_venda/src/module/gasto/pages/gasto/gasto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class GastoListView extends StatefulWidget {
  const GastoListView({super.key});

  @override
  State<GastoListView> createState() => _GastoListViewState();
}

class _GastoListViewState extends State<GastoListView>
    with Loader, SnackbarManager {
  final _controller = Modular.get<GastoController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    super.initState();
    _initReaction();
    _controller.findByCondition('1 = 1');
  }

  @override
  void dispose() {
    super.dispose();
    statusReactionDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      persistentFooterButtons: [
        Observer(
          builder: (_) => FooterPaginationBar(
            paginaAtual: 0,
            setPagAtual: (i) => 0,
            pageSize: 0,
            isLastPage: true,
            totalRegistros: 0,
            size: 0,
            pages: 0,
          ),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.insert(Gasto.novo());
        },
        child: const Icon(Icons.add),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: _controller.dataProvider.length,
          itemBuilder: (context, index) {
            final gasto = _controller.dataProvider[index];
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Expanded(child: Text(gasto.descricao ?? '')),
                    Text(formatCurrency(gasto.vlGasto ?? 0, 1)),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUENTA: ${gasto.caixa!.observacao}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(gasto.classificacaoGasto?.descricao ?? ''),
                    Text(formatDateAndTimeShort(gasto.dtGasto)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _initReaction() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        statusReactionDisposer = reaction(
          (_) => _controller.status,
          (status) {
            switch (status) {
              case GastoStatusState.initial:
                hideLoader();
                break;
              case GastoStatusState.loaded:
                hideLoader();
                break;
              case GastoStatusState.loading:
                showLoader();
                break;
              case GastoStatusState.success:
                hideLoader();
                showSuccess(_controller.message);
                break;
              case GastoStatusState.error:
                hideLoader();
                showError(_controller.message);
                break;
              case GastoStatusState.insertOrUpdate:
                hideLoader();
                Modular.to.pushNamed('/home/gasto/novo');
                break;
              default:
                hideLoader();
            }
          },
        );
      },
    );
  }
}
