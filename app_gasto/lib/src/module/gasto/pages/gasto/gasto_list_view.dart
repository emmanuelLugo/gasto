import 'package:app_venda/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_venda/src/module/gasto/models/gasto.dart';
import 'package:app_venda/src/module/gasto/pages/gasto/gasto_controller.dart';
import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.insert(Gasto.novo());
        },
        child: const Icon(Icons.add),
      ),
      body: Container(),
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
