import 'package:app_gasto/src/core/pagination/footer_pagination_bar.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/core/ui/widget/custom_slidable_action_widget.dart';
import 'package:app_gasto/src/core/ui/widget/search_app_bar_widget.dart';
import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/widgets/card_gasto_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GastoListView extends StatefulWidget {
  const GastoListView({super.key});

  @override
  State<GastoListView> createState() => _GastoListViewState();
}

class _GastoListViewState extends State<GastoListView>
    with Loader, SnackbarManager {
  final _controller = Modular.get<GastoController>();
  late final ReactionDisposer _statusReactionDisposer;

  @override
  void initState() {
    super.initState();
    _initReaction();
    _controller.findByConditionPage('');
  }

  @override
  void dispose() {
    super.dispose();
    _statusReactionDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarWidget(
          onSearch: (value) => _controller.findByConditionPage(value),
          hintText: 'Buscar por Descripción'),
      persistentFooterButtons: [
        Observer(
          builder: (_) => FooterPaginationBar(
            paginaAtual: _controller.pagination.pageNr,
            setPagAtual: (i) => _controller.setPaginaAtual(i),
            pageSize: _controller.pagination.pageSize,
            isLastPage: _controller.pagination.isLastPage,
            totalRegistros: _controller.pagination.totalRegistros,
            pages: _controller.pagination.pages,
          ),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.insert(Gasto.novo()),
        child: const Icon(Icons.add),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (_) {
        return Skeletonizer(
          enableSwitchAnimation: true,
          enabled: _controller.status == GastoStatusState.loading,
          child: _controller.status == GastoStatusState.loading
              ? ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final gasto = Gasto.skeletonizer();
                    return _buildSlidableItem(gasto, index);
                  },
                )
              : ListView.builder(
                  itemCount: _controller.dataProvider.length,
                  itemBuilder: (context, index) {
                    final gasto = _controller.dataProvider[index];
                    return _buildSlidableItem(gasto, index);
                  },
                ),
        );
      },
    );
  }

  Widget _buildSlidableItem(Gasto gasto, int index) {
    return Slidable(
      key: ValueKey(index.toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .27,
        children: [
          CustomSlidableActionWidget(
            label: 'Cancelar',
            icon: Icons.cancel,
            onPressed: () => _showCancelConfirmationDialog(gasto),
          ),
        ],
      ),
      child: CardGastoWidget(gasto: gasto),
    );
  }

  void _showCancelConfirmationDialog(Gasto gasto) async {
    final shouldCancel = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content:
              const Text('¿Estás seguro de que deseas cancelar este gasto?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Sí'),
            ),
          ],
        );
      },
    );

    if (shouldCancel ?? false) {
      _cancelaGasto(gasto);
    }
  }

  void _cancelaGasto(Gasto gasto) async {
    await _controller.cancelaGasto(gasto);
  }

  void _initReaction() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _statusReactionDisposer = reaction(
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
                Modular.to.pop();
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
