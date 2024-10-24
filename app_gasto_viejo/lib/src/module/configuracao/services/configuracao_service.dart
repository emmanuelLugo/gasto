import 'package:app_venda/src/core/api/host_name.dart';
import 'package:app_venda/src/core/dio/rest_client.dart';
import 'package:app_venda/src/core/global/key_constants.dart';
import 'package:app_venda/src/core/storage/local_storage_service.dart';

class ConfiguracaoService {
  final RestClient _restClient;

  ConfiguracaoService(this._restClient);

  Future<void> saveIP(String ip) async {
    await LocalStorageService.instance
        .write(key: KeyConstants.ip.key, value: ip);
    await Hostname.instance.changeIp(ip);
    _restClient.updateURL();
  }
}
