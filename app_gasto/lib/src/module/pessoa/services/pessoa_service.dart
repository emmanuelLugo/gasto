import 'package:app_venda/src/core/exceptions/exception_utils.dart';
import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/pessoa/models/pessoa.dart';
import 'package:app_venda/src/module/pessoa/repositories/pessoa_repository.dart';

class PessoaService {
  final PessoaRepository repository;

  PessoaService(
    this.repository,
  );

  Future<List<Pessoa>> findByCondition(
    String condition,
  ) async {
    try {
      if (condition.isEmpty) {
        condition = '1=1';
      } else {
        condition = '(BS_PESSOA.NOME LIKE "%$condition%")';
      }

      final response = await repository.findByCondition(
        condition,
      );
      return response;
    } on Exception catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
