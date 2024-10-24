import 'package:app_venda/src/core/dio/rest_client.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/module/home/models/controle_acesso/controle_acesso.dart';

class ControleAcessoRepository {
  final RestClient restClient;

  ControleAcessoRepository(
    this.restClient,
  );

  Future<ControleAcesso> findControleAcessoByUsuario() async {
    try {
      final response =
          await restClient.get('/controleAcessoWS/findbyUsuarioControleAcesso');

      return ControleAcesso.fromJson(response.data);
    } on RepositoryException catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
