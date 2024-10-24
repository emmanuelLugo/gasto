import 'package:app_gasto/src/core/api/host_name.dart';
import 'package:app_gasto/src/core/components/fields/text_form_input/upper_case_text_formatter.dart';
import 'package:app_gasto/src/core/global/image_constants.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:app_gasto/src/core/ui/styles/text_styles.dart';
import 'package:app_gasto/src/module/login/pages/login/widgets/buttons_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with Loader, SnackbarManager {
  LoginController controller = Modular.get();
  final emailEC = TextEditingController();
  final senhaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var showPassword = false;

  bool biometriaDisponivel = false;

  @override
  void initState() {
    super.initState();

    if (Hostname.instance.ip.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _autoLogin();
        if (kDebugMode) {
          emailEC.text = 'R';
          senhaEC.text = '123';
        }
      });
    }
  }

  @override
  void dispose() {
    emailEC.dispose();
    senhaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constrains) {
            return SizedBox(
              child: Row(
                children: [
                  if (context.isMobile == false)
                    Flexible(
                      flex: 7,
                      child: Container(
                        color: ColorsApp.instance.primary,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(50),
                            child: Container(
                              height: 170,
                              width: context.screenWidth,
                              margin: const EdgeInsets.all(10),
                              child: Image.asset(ImageConstants.LOGO),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Flexible(
                    flex: 5,
                    child: LayoutBuilder(
                      builder: (_, constrains) {
                        final double width = constrains.maxWidth > 600
                            ? 600
                            : constrains.maxWidth;
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: SizedBox(
                              width: width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (context.isMobile)
                                    Container(
                                      height: 170,
                                      width: context.screenWidth,
                                      margin: const EdgeInsets.all(10),
                                      child: Image.asset(ImageConstants.LOGO),
                                    ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: emailEC,
                                    autofocus: true,
                                    keyboardType: TextInputType.name,
                                    autofillHints: const [
                                      AutofillHints.username
                                    ],
                                    textInputAction: TextInputAction.next,
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                          'Usuario requerido'),
                                    ]),
                                    decoration: const InputDecoration(
                                      labelText: 'Usuario',
                                    ),
                                    inputFormatters: [
                                      UpperCaseTextFormatter(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) {
                                      return TextFormField(
                                        inputFormatters: [
                                          UpperCaseTextFormatter(),
                                        ],
                                        obscureText: !showPassword,
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        controller: senhaEC,
                                        validator: Validatorless.required(
                                            'Campo Obligatorio'),
                                        decoration: InputDecoration(
                                          labelText: 'Contraseña',
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showPassword = !showPassword;
                                              });
                                            },
                                            child: Icon(
                                              (showPassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              size: 27,
                                            ),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) =>
                                            _formSubmit(),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: context.screenWidth,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _formSubmit();
                                      },
                                      child: Text(
                                        'Login',
                                        style: context.textStyles.textRegular
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ButtonsWidget(controller: controller),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _formSubmit() async {
    final formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      TextInput.finishAutofillContext();
      await controller.login(emailEC.text, senhaEC.text);
    }
  }

  Future<void> _autoLogin() async {
    await controller.autoLogin();
  }
}
