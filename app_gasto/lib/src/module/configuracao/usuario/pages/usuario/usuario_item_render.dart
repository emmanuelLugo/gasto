// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:venta/src/modules/login/models/usuario.dart';
// import 'package:venta/src/modules/usuario/pages/usuario/usuario_controller.dart';

// class UsuarioItemRender extends StatelessWidget {
//   final UsuarioController controller;
//   final Usuario usuario;

//   const UsuarioItemRender({
//     Key? key,
//     required this.controller,
//     required this.usuario,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       trailing: const Icon(Icons.edit),
//       onTap: () {
//         controller.currentRecord = usuario;
//         controller.edit(usuario);
//       },
//       title: Row(
//         children: [
//           Expanded(
//             child: Text(
//               usuario.nome,
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
