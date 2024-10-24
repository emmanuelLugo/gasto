import 'dart:io';

import 'package:app_venda/src/core/global/key_constants.dart';
import 'package:app_venda/src/core/storage/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      if (Platform.isAndroid) {
        final ip =
            await LocalStorageService.instance.get(key: KeyConstants.ip.key);
        if (ip == null) {
          Modular.to.pushNamedAndRemoveUntil(
              '/home/configuracao/configuracao_ip', (_) => false,
              arguments: false);
        } else {
          Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
        }
      } else {
        Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var theme = context.watch<ThemeNotifier>();
    // theme.getTheme();
    return const Scaffold(
      body: Center(
          // child: Image.asset(
          //   ImageConstants.LOGO,
          //   width: 200,
          // ),
          ),
    );
  }
}
