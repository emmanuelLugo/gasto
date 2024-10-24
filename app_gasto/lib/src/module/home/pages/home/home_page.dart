import 'dart:io';

import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/home/pages/home/configuracao_sistema_controller.dart';
import 'package:app_gasto/src/module/home/pages/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, SnackbarManager {
  final DataShared dataShared = Modular.get();
  final ConfiguracaoSistemaController controller = Modular.get();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.findConfiguracoesSistema();
      _reactionInitializer();
    });
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido/a ${dataShared.usuario!.nome}'),
      ),
      drawer: HomeDrawer(
        dataShared: dataShared,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          _showFecharApp();
        },
        child: const Center(),
      ),
    );
  }

  void _showFecharApp() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Salir de la aplicación"),
          content: const Text(
              "¿Estás seguro de que quieres salir de la aplicación?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancelar",
                style: TextStyle(color: ColorsApp.instance.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                exit(0);
              },
              child: Text(
                "Salir",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsApp.instance.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _reactionInitializer() {
    statusDisposer = reaction(
      (_) => controller.status,
      (status) {
        switch (status) {
          case HomeStatusState.initial:
            hideLoader();
            break;
          case HomeStatusState.loading:
            showLoader();
            break;
          case HomeStatusState.loaded:
            hideLoader();
            break;
          case HomeStatusState.error:
            hideLoader();
            showError(controller.message);
            break;
        }
      },
    );
  }
}
