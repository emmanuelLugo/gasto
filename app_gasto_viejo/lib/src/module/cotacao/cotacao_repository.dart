import 'package:app_venda/src/core/dio/rest_client.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/module/cotacao/models/cotacao/cotacao.dart';

class CotacaoRepository {
  final RestClient restClient;
  CotacaoRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<Cotacao?> findCotacaoAtual() async {
    try {
      final response = await restClient.get('/cotacao/findCotacaoAtual');
      return Cotacao.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }

  Future<Cotacao?> save(Cotacao cotacao) async {
    try {
      cotacao.dtCotacao = null;
      final response =
          await restClient.post('/cotacao/save', data: cotacao.toJson());
      return Cotacao.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
