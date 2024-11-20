import 'package:app_gasto/src/core/ui/styles/theme_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    });

    return MaterialApp.router(
      title: 'Gestor de Gastos',
      debugShowCheckedModeBanner: kDebugMode ? true : false,
      routerConfig: Modular.routerConfig,
      theme: ThemeConfig.theme,
      locale: const Locale('es', 'PY'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) => ResponsiveWrapper.builder(
        child!,
        minWidth: 480,
        defaultName: MOBILE,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1200,
              name: DESKTOP, scaleFactor: 0.8),
        ],
      ),
    );
  }
}
