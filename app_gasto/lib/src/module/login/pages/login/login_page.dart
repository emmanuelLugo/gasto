import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'login_controller.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SnackbarManager, Loader {
  final LoginController controller = Modular.get();

  late ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    super.initState();
    reactionInitializer();
  }

  @override
  void dispose() {
    statusReactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LoginForm(),
      ),
    );
  }

  void reactionInitializer() {
    statusReactionDisposer = reaction(
      (_) => controller.status,
      (status) {
        switch (status) {
          case LoginState.initial:
            hideLoader();
            break;
          case LoginState.loading:
            showLoader();
            break;
          case LoginState.success:
            Modular.to.pushNamedAndRemoveUntil('/home/', (_) => false);
            hideLoader();
            break;
          case LoginState.semLicencia:
            Modular.to.pushNamedAndRemoveUntil('/licencia', (_) => false);
            hideLoader();
            break;
          case LoginState.error:
            hideLoader();
            showError(controller.message ?? '');
            break;
          default:
            hideLoader();
        }
      },
    );
  }
}
