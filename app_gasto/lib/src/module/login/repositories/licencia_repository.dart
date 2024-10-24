import 'package:app_gasto/src/core/dio/rest_client.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/module/login/models/licencia.dart';

class LicenciaRepository {
  final RestClient restClient;

  LicenciaRepository(this.restClient);

  Future<Licencia> atualizaLicencia(String serie) async {
    try {
      final response = await restClient.post("/licencia/atualizaLicencia",
          queryParameters: {'serie': serie});
      return Licencia.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
