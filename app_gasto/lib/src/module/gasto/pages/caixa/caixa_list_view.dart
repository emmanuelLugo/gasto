import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/caixa_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/widgets/card_caixa_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CaixaListView extends StatefulWidget {
  const CaixaListView({super.key});

  @override
  State<CaixaListView> createState() => _CaixaListViewState();
}

class _CaixaListViewState extends State<CaixaListView> with Loader, SnackbarManager {
  final _controller = Modular.get<CaixaController>();
  late final ReactionDisposer _statusReactionDisposer;

  @override
  void initState() {
    super.initState();
    _initReaction();
    _controller.findByCondition('');
  }

  @override
  void dispose() {
    super.dispose();
    _statusReactionDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Caja'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.insert(Caixa.novo()),
        child: const Icon(Icons.add),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: Observer(
            builder: (_) {
              return Skeletonizer(
                enableSwitchAnimation: true,
                enabled: _controller.status == CaixaStatusState.loading,
                child: _controller.status == CaixaStatusState.loading
                    ? ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          final caixa = Caixa(isAberto: true);
                          return CardCaixaWidget(
                            caixa: caixa,
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: _controller.dataProvider.length,
                        itemBuilder: (context, index) {
                          final caixa = _controller.dataProvider[index];
                          return CardCaixaWidget(
                            caixa: caixa,
                            onTap: () => _controller.insert(caixa),
                          );
                        },
                      ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _initReaction() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _statusReactionDisposer = reaction(
          (_) => _controller.status,
          (status) {
            switch (status) {
              case CaixaStatusState.initial:
                hideLoader();
                break;
              case CaixaStatusState.loaded:
                hideLoader();
                break;
              case CaixaStatusState.loading:
                showLoader();
                break;
              case CaixaStatusState.success:
                hideLoader();
                Modular.to.pop();
                showSuccess(_controller.message);
                break;
              case CaixaStatusState.error:
                hideLoader();
                showError(_controller.message);
                break;
              case CaixaStatusState.insertOrUpdate:
                hideLoader();
                Modular.to.pushNamed('/home/gasto/new-caixa');
                break;
              default:
            }
          },
        );
      },
    );
  }
}
