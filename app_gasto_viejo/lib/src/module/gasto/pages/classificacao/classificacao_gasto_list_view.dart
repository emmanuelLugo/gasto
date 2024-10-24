import 'dart:developer';

import 'package:app_venda/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_venda/src/core/ui/widget/custom_slidable_action_widget.dart';
import 'package:app_venda/src/core/ui/widget/search_app_bar_widget.dart';
import 'package:app_venda/src/core/utils/empty_list.dart';
import 'package:app_venda/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_venda/src/module/gasto/pages/classificacao/classificacao_gasto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';

class ClassificacaoGastoListView extends StatefulWidget {
  const ClassificacaoGastoListView({super.key});

  @override
  State<ClassificacaoGastoListView> createState() =>
      _ClassificacaoGastoListViewState();
}

class _ClassificacaoGastoListViewState extends State<ClassificacaoGastoListView>
    with Loader, SnackbarManager {
  final _controller = Modular.get<ClassificacaoGastoController>();
  late ReactionDisposer statusReactionDisposer;

  @override
  void dispose() {
    super.dispose();
    statusReactionDisposer();
  }

  @override
  void initState() {
    super.initState();
    _initReaction();
    _controller.findByCondition('');
    log(Modular.to.path, name: 'modular');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarWidget(
          onSearch: (value) => _controller.findByCondition(value),
          hintText: 'Buscar'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.insert(ClassificacaoGasto());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                return _controller.dataProvider.isEmpty
                    ? const EmptyList()
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: _controller.dataProvider.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final ClassificacaoGasto classificacaoGasto =
                              _controller.dataProvider[index];
                          return _buildSlidableItem(classificacaoGasto, index);
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSlidableItem(ClassificacaoGasto classificacaoGasto, int index) {
    return Slidable(
      key: ValueKey(index.toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .23,
        children: [
          CustomSlidableActionWidget(
            label: 'Editar',
            icon: Icons.edit_rounded,
            onPressed: () => _controller.insert(classificacaoGasto),
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          title: Text('${classificacaoGasto.descricao}'),
          trailing: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  void _initReaction() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        statusReactionDisposer = reaction(
          (_) => _controller.status,
          (status) {
            switch (status) {
              case ClassificacaoGastoStatusState.initial:
                hideLoader();
                break;
              case ClassificacaoGastoStatusState.loaded:
                hideLoader();
                break;
              case ClassificacaoGastoStatusState.loading:
                showLoader();
                break;
              case ClassificacaoGastoStatusState.succes:
                hideLoader();
                Modular.to.pop();
                showSuccess(_controller.message);
                break;
              case ClassificacaoGastoStatusState.error:
                hideLoader();
                showError(_controller.message);
                break;
              case ClassificacaoGastoStatusState.insert:
                hideLoader();
                Modular.to.pushNamed(
                    '/home/gasto/classificacao-gasto/new-classificacao');
                break;
              default:
            }
          },
        );
      },
    );
  }
}
