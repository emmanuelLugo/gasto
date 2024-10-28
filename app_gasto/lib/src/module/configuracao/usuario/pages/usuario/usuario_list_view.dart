// import 'package:venta/src/components/core/ui/custom_scaffold.dart';
// import 'package:venta/src/modules/login/models/usuario.dart';
// import 'package:venta/src/components/core/search/search_view.dart';
// import 'package:venta/src/modules/usuario/pages/usuario/usuario_controller.dart';
// import 'package:venta/src/modules/usuario/pages/usuario/usuario_item_render.dart';
// import 'package:venta/src/modules/usuario/pages/usuario/usuario_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';

// import '../../../../components/core/ui/loader.dart';
// import '../../../../components/core/ui/snack_bar_manager.dart';
// import '../../../../components/core/utils/empty_list.dart';

// class UsuarioListView extends StatefulWidget {
//   const UsuarioListView({super.key});

//   @override
//   State<UsuarioListView> createState() => _UsuarioListViewState();
// }

// class _UsuarioListViewState extends State<UsuarioListView>
//     with Loader, SnackbarManager {
//   late final ReactionDisposer statusDisposer;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       statusDisposer = reaction((_) => _controller.status, (status) {
//         switch (status) {
//           case UsuarioStatusState.initial:
//             break;
//           case UsuarioStatusState.loading:
//             showLoader();
//             break;
//           case UsuarioStatusState.loaded:
//             hideLoader();
//             break;
//           case UsuarioStatusState.succes:
//             hideLoader();
//             showSuccess(_controller.message, isDesktop: true);
//             Modular.to.pop();
//             _controller.findByCondition();
//             break;
//           case UsuarioStatusState.error:
//             hideLoader();
//             showError(_controller.message, isDesktop: true);
//             break;
//           case UsuarioStatusState.insertOrUpdate:
//             hideLoader();

//             Modular.to.push(
//               MaterialPageRoute(
//                 builder: (_) => const UsuarioPage(),
//               ),
//             );

//             break;
//         }
//       });
//     });
//     _controller.findByCondition();
//     super.initState();
//   }

//   final _controller = Modular.get<UsuarioController>();

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//         appBar: AppBar(
//           title: const Text('Usuarios'),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               SearchView(
//                 title: 'Consulte por Nombre',
//                 controller: _controller,
//               ),
//               Expanded(
//                 child: Observer(
//                   builder: (_) {
//                     return _controller.dataProvider.isEmpty
//                         ? const EmptyList()
//                         : ListView.separated(
//                             itemCount: _controller.dataProvider.length,
//                             itemBuilder: (context, index) {
//                               Usuario usuario = _controller.dataProvider[index];
//                               return Column(
//                                 children: [
//                                   UsuarioItemRender(
//                                       controller: _controller,
//                                       usuario: usuario),
//                                 ],
//                               );
//                             },
//                             separatorBuilder: (context, index) =>
//                                 const Divider(),
//                           );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
