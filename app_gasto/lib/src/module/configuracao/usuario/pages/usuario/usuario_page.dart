// import 'package:venta/src/components/core/inputs/text_inputs/text_input_form.dart';
// import 'package:venta/src/components/core/ui/custom_scaffold.dart';
// import 'package:venta/src/modules/usuario/pages/usuario/usuario_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:validatorless/validatorless.dart';

// import '../../../../components/core/ui/loader.dart';
// import '../../../../components/core/ui/snack_bar_manager.dart';

// class UsuarioPage extends StatefulWidget {
//   const UsuarioPage({super.key});

//   @override
//   State<UsuarioPage> createState() => _UsuarioPageState();
// }

// class _UsuarioPageState extends State<UsuarioPage>
//     with Loader, SnackbarManager {
//   final _formKey = GlobalKey<FormState>();
//   final controller = Modular.get<UsuarioController>();
//   bool isDesktop = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       appBar: AppBar(
//         title: const Text('Nuevo Usuario'),
//       ),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Observer(
//                     builder: (_) {
//                       return TextInputForm(
//                         label: 'Login',
//                         // initValue: controller.currentRecord.login,
//                         validator:
//                             Validatorless.required('El Campo es Requerido'),
//                         onChanged: (value) {
//                           String uppercaseValue = value.toUpperCase();
//                           controller.currentRecord.login = uppercaseValue;
//                         },
//                         autoFocus: true,
//                       );
//                     },
//                   ),
//                   Observer(
//                     builder: (_) {
//                       return TextInputForm(
//                         label: 'Nombre',
//                         // initValue: controller.currentRecord.nome,
//                         validator:
//                             Validatorless.required('El Campo es Requerido'),
//                         onChanged: (value) {
//                           String uppercaseValue = value.toUpperCase();
//                           controller.currentRecord.nome = uppercaseValue;
//                         },
//                       );
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         _save();
//                       },
//                       child: const Text('Guardar'),
//                     ),
//                   )
//                 ],
//               )),
//         ),
//       ),
//     );
//   }

//   void _save() async {
//     if (_formKey.currentState!.validate()) {
//       controller.currentRecord.ativo ??= true;
//       await controller.save();
//     }
//   }
// }
