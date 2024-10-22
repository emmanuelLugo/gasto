import 'dart:developer';
import 'dart:io';

import 'package:app_venda/src/core/environments/environments.dart';
import 'package:app_venda/src/core/global/image_constants.dart';
import 'package:app_venda/src/core/global/key_constants.dart';
import 'package:app_venda/src/core/storage/local_storage_service.dart';

class Hostname {
  String ip = "";

  //CAMBIAR - NO COMMITAR
  final String _apiProd = "/api";
  String urlServer = "";

  Hostname._privateConstructor();

  static final Hostname _instance = Hostname._privateConstructor();

  static Hostname get instance => _instance;

  init() async {
    String? host = 'localhost:8090';
    //VER PARA CAMBIAR DESPUES
    if (Platform.isAndroid) {
      host = await LocalStorageService.instance.get(key: KeyConstants.ip.key);
    } else {
      host =
          "${Environments.param('urlBaseDev')}:${Environments.param('portaDev')}";
    }

    if (host != null) {
      ip = "http://$host$_apiProd/";

      log('=================IP=====================');
      log(ip);
      log('========================================');

      urlServer = '${ip}file/files/';

      log('================URL SERVER==============');
      log(urlServer);
      log('========================================');
    }
  }

  String httpImageURL(String? pathImage) {
    if (pathImage == null) {
      return ImageConstants.NO_IMAGE;
    }
    final String url = '$urlServer$pathImage';
    return url;
  }

  Future<void> changeIp(String novoIP) async {
    ip = "http://$novoIP$_apiProd/";
    urlServer = '${ip}file/files/';
  }
}
