// import '../../../components/core/exceptions/repository_exception.dart';
// import '../../../components/core/helper/dio/rest_client.dart';
// import '../../../components/core/helper/dio/rest_client_exception.dart';
// import '../../login/models/usuario.dart';

// class UsuarioRepository {
//   Future<List<Usuario>> findByCondition(String condition) async {
//     try {
//       List<Usuario> list = [];
//       final response = await RestClient.auth().get("/usuario/findByCondition",
//           queryParameters: {'condition': condition});
//       list = response.data
//       .map<Usuario>((e) => Usuario.fromJson(e))
//       .toList();
//       return list;
//     } on RestClientException catch (e) {
//       throw RepositoryException(
//           message: e.statusMessage ?? 'Error al Consultar Usuarios');
//     }
//   }

//   Future<Usuario> save(Usuario usuario) async {
//     try {
//       final response = await RestClient.auth()
//           .post("/usuario/registrar", data: usuario.toJson());
//       return Usuario.fromJson(response.data);
//     } on RestClientException catch (e) {
//       throw RepositoryException(
//           message: e.statusMessage ?? 'Error al guardar Usuario');
//     }
//   }
// }
