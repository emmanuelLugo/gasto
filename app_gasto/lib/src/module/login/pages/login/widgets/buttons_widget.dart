import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:app_venda/src/module/login/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonsWidget extends StatelessWidget {
  final LoginController controller;

  const ButtonsWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: ColorsApp.instance.grey,
          ),
          onPressed: () {
            Modular.to.pushNamed('/home/configuracao/configuracao_ip');
          },
          icon: const Icon(
            Icons.settings,
          ),
          label: const Text('Configuración'),
        ),
        // TextButton.icon(
        //   style: ElevatedButton.styleFrom(
        //     foregroundColor: ColorsApp.instance.grey,
        //   ),
        //   onPressed: () {
        //     // controller.openWhatsApp();
        //   },
        //   icon: const Icon(
        //     Ionicons.logo_whatsapp,
        //   ),
        //   label: const Text('Soporte Técnico'),
        // ),
      ],
    );
  }
}
