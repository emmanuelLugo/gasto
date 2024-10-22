import 'package:app_venda/src/core/dio/rest_client.dart';
import 'package:app_venda/src/core/exceptions/repository_exception.dart';
import 'package:app_venda/src/module/login/models/jwt_response.dart';

class LoginRepository {
  final RestClient restClient;

  LoginRepository(this.restClient);

  Future<JwtResponse> login(String username, String password) async {
    try {
      final response = await restClient.post("/auth/login",
          data: {'username': username, 'password': password});
      return JwtResponse.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
