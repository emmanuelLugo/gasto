import 'package:app_venda/src/core/dio/rest_client.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/module/home/models/parametro/parametros.dart';

class ParametroRepository {
  final RestClient restClient;

  ParametroRepository({required RestClient restClient})
      : restClient = RestClient.auth();

  Future<Parametros> findParametro(String parametro) async {
    try {
      final response = await restClient.get('/parametros/findParametro',
          queryParameters: {'chave': parametro});
      return Parametros.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
