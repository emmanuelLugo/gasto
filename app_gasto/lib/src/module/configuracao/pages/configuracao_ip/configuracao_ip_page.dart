import 'package:app_gasto/src/core/components/fields/text_form_input/text_input_form.dart';
import 'package:app_gasto/src/core/global/key_constants.dart';
import 'package:app_gasto/src/core/storage/local_storage_service.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/custom_scaffold.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/core/ui/styles/text_styles.dart';
import 'package:app_gasto/src/module/configuracao/pages/configuracao_ip/configuracao_ip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';

class ConfiguracaoIpPage extends StatefulWidget {
  const ConfiguracaoIpPage({super.key});

  @override
  State<ConfiguracaoIpPage> createState() => _ConfiguracaoIpPageState();
}

class _ConfiguracaoIpPageState extends State<ConfiguracaoIpPage>
    with SnackbarManager, Loader {
  final controller = Modular.get<ConfiguracaoIpController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ipEC = TextEditingController();

  late ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    loadCurrentIP();
    initReaction();
    super.initState();
  }

  @override
  void dispose() {
    ipEC.dispose();
    statusReactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        appBar: AppBar(
          title: Text(
            'Configuración',
            style: context.textStyles.textRegular.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                salvaIPShared(ipEC.text);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputForm(
                    label: "IP del Servidor",
                    hintText: 'Ej: 192.168.0.1:8080',
                    controller: ipEC,
                    validator: (ip) {
                      if (ip!.isEmpty) {
                        return 'IP requerida';
                      }
                      final RegExp regex = RegExp(
                          r'^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}):(\d{1,5})$');
                      if (!regex.hasMatch(ip)) {
                        return 'IP invalida - Formato: xxx.xxx.xxx.xxx:xxxx';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          testIP(ipEC.text);
                        },
                        child: const Text('Probar IP')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> salvaIPShared(String text) async {
    if (formKey.currentState!.validate()) {
      controller.salvaIP(text).then((value) {
        if (Modular.args.data != null) {
          Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
        }
      });
    }
  }

  Future<void> loadCurrentIP() async {
    final value =
        await LocalStorageService.instance.get(key: KeyConstants.ip.key);
    if (value != null) {
      ipEC.text = value;
    }
  }

  void initReaction() {
    statusReactionDisposer = reaction((_) => controller.status, (status) {
      switch (status) {
        case ConfiguracaoState.initial:
          hideLoader();
          break;
        case ConfiguracaoState.loading:
          showLoader();
          break;
        case ConfiguracaoState.success:
          hideLoader();
          showSuccess(controller.message ?? "");
          break;
        case ConfiguracaoState.error:
          hideLoader();
          showError(controller.message);
          break;
        default:
      }
    });
  }

  void testIP(String ip) async {
    if (formKey.currentState!.validate()) {
      showLoader();
      try {
        final parts = ip.split(':');
        final host = parts[0];
        final port = int.parse(parts[1]);

        final socket = await Socket.connect(host, port,
            timeout: const Duration(seconds: 5));
        socket.destroy();

        hideLoader();
        showSuccess('La IP es accesible');
      } catch (e) {
        hideLoader();
        showError('No se pudo establecer conexión con la IP: ${ipEC.text}');
      }
    }
  }
}
