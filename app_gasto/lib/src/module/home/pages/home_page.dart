import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/home/pages/configuracao_sistema_controller.dart';
import 'package:app_gasto/src/module/home/pages/widgets/home_drawer.dart';
import 'package:app_gasto/src/module/home/pages/widgets/home_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, SnackbarManager {
  final DataShared dataShared = Modular.get();
  final ConfiguracaoSistemaController _controller = Modular.get();
  late final ReactionDisposer statusDisposer;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reactionInitializer();
      _controller.handleConfiguracoesSistema();
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
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 16, 16),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.handleConfiguracoesSistema();
          // Modular.to.pushNamed('/home/gasto/novo');
        },
        child: const Icon(Icons.add),
      ),
      drawer: HomeDrawer(
        dataShared: dataShared,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) => _showFecharApp(),
        child: HomeFormPage(
          dataShared: dataShared,
          controller: _controller,
        ),
      ),
    );
  }

  void _showFecharApp() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeDrawer();
      _controller.handleConfiguracoesSistema();
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Salir de la aplicación"),
          content: const Text("¿Estás seguro de que quieres salir de la aplicación?"),
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
                SystemNavigator.pop();
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
      (_) => _controller.status,
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
            showError(_controller.message);
            break;
        }
      },
    );
  }
}
