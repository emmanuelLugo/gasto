import 'dart:developer';

import 'package:app_gasto/src/core/global/image_constants.dart';
import 'package:app_gasto/src/core/global/key_constants.dart';
import 'package:app_gasto/src/core/storage/local_storage_service.dart';

class Hostname {
  String ip = "";

  //CAMBIAR - NO COMMITAR
  final String _apiProd = "/GastoSystem/api";
  String urlServer = "";

  Hostname._privateConstructor();

  static final Hostname _instance = Hostname._privateConstructor();

  static Hostname get instance => _instance;

  init() async {
    String? host = 'localhost:8090';
    //VER PARA CAMBIAR DESPUES
    host = await LocalStorageService.instance.get(key: KeyConstants.ip.key);

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
