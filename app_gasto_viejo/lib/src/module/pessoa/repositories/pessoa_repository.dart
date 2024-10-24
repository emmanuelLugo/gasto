import 'package:app_venda/src/core/dio/rest_client.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/module/pessoa/models/pessoa.dart';

class PessoaRepository {
  final RestClient restClient;
  PessoaRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<List<Pessoa>> findByCondition(String condition) async {
    try {
      List<Pessoa> list = [];
      final response = await restClient.get(
        '/pessoa/findByCondition',
        queryParameters: {
          'condition': condition,
        },
      );
      list = response.data.map<Pessoa>((e) => Pessoa.fromJson(e)).toList();

      return list;
    } on Exception catch (e) {
      throw RepositoryException.toException(e);
    }
  }
}
