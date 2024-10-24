import 'package:app_venda/src/core/ui/helpers/helpers/custom_scaffold.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_venda/src/module/login/pages/licencia/licencia_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:validatorless/validatorless.dart';

class SemLicenciaPage extends StatefulWidget {
  const SemLicenciaPage({super.key});

  @override
  State<SemLicenciaPage> createState() => _SemLicenciaPageState();
}

class _SemLicenciaPageState extends State<SemLicenciaPage>
    with Loader, SnackbarManager {
  late final ReactionDisposer statusDisposer;

  bool isDesktop = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    initReaction();
    super.initState();
  }

  void initReaction() {
    statusDisposer = reaction(
      (_) => controller.status,
      (status) {
        switch (status) {
          case LicenciaStatusState.initial:
            hideLoader();
            break;
          case LicenciaStatusState.loading:
            showLoader();
            break;
          case LicenciaStatusState.succes:
            hideLoader();
            licenciaAtivada();
            break;
          case LicenciaStatusState.error:
            showError(controller.message);
            hideLoader();
            break;
          case LicenciaStatusState.loaded:
            hideLoader();
            break;
        }
      },
    );
  }

  void licenciaAtivada() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Licencia activada Con Exito'),
        content: Text(
            'La nueva Licencia es válida hasta el: ${controller.dtVencimento}'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Modular.to.pushNamedAndRemoveUntil(
                '/login',
                (p0) => false,
                arguments: false,
              );
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  final controller = Modular.get<LicenciaController>();
  final serieEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    isDesktop = ResponsiveWrapper.of(context).isDesktop;
    return CustomScaffold(
      appBar: AppBar(
        title: const Text('Licencia'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sin licencia, favor comunicarse con el Administrador del Sistema',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: serieEC,
                      validator:
                          Validatorless.required('El Campo es Requerido'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _atualizaLicencia();
                    },
                    child: const Text('Actualizar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _atualizaLicencia() async {
    if (_formKey.currentState!.validate()) {
      controller.atualizaLicencia(serieEC.text);
    }
  }
}
