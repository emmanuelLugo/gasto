import 'package:app_venda/src/core/global/key_constants.dart';
import 'package:app_venda/src/core/storage/local_storage_service.dart';
import 'package:app_venda/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:app_venda/src/core/utils/image/image_util.dart';
import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/core/shared/parametros_shared.dart';
import 'package:app_venda/src/module/core/shared/telas_shared.dart';
import 'package:app_venda/src/module/home/pages/widgets/expansion_tile_gasto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeDrawer extends StatefulWidget {
  final DataShared dataShared;
  final ParametrosShared parametrosShared;
  final TelasShared telasShared;
  const HomeDrawer({
    super.key,
    required this.dataShared,
    required this.telasShared,
    required this.parametrosShared,
  });

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildDrawerHeader(),
          Expanded(child: buildListView()),
          buildFecharSessao(),
        ],
      ),
    );
  }

  Widget buildDrawerHeader() {
    return DrawerHeader(
      child: SizedBox(
        width: context.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                color: const Color(0XFFEEEEEE),
                height: 100,
                width: 100,
                child: customImageWidget(widget.dataShared.empresa!.urlFoto),
              ),
            ),
            Text('Saludos, ${widget.dataShared.usuario!.nome!}'),
          ],
        ),
      ),
    );
  }

  Widget buildListView() {
    final titleStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.bold);
    final dividerColor = Colors.grey.withOpacity(.4);

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: dividerColor),
      child: ListView(
        children: [
          ExpansionTileGasto(
            telasShared: widget.telasShared,
            dataShared: widget.dataShared,
            titleStyle: titleStyle,
          ),

          // ExpansionTileConfiguracao(parametrosShared: widget.parametrosShared),
        ],
      ),
    );
  }

  Widget buildFecharSessao() {
    return ListTile(
      title: const Text(
        'Cerrar sesión',
        style: TextStyle(),
      ),
      trailing: const Icon(
        Icons.exit_to_app,
        color: Colors.red,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Aviso'),
            content: const Text('Cerrar sesión?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Volver'),
                child: Text(
                  'Volver',
                  style: TextStyle(color: ColorsApp.instance.grey),
                ),
              ),
              TextButton(
                onPressed: () async {
                  _fecharSessao();
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
      },
    );
  }

  Future<void> _fecharSessao() async {
    await LocalStorageService.instance.delete(key: KeyConstants.token.key);
    await LocalStorageService.instance
        .delete(key: KeyConstants.loginUsuario.key);
    await LocalStorageService.instance.delete(key: KeyConstants.loginSenha.key);
    widget.dataShared.clear();
    Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
  }
}
