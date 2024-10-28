// import 'package:mobx/mobx.dart';

 

// part 'usuario_controller.g.dart';

// enum UsuarioStatusState {
//   initial,
//   loading,
//   loaded,
//   succes,
//   error,
//   insertOrUpdate,
// }

// class UsuarioController = UsuarioControllerBase with _$UsuarioController;

// abstract class UsuarioControllerBase
//     with Store
//     implements ControllerBase<Usuario> {
//   final UsuarioRepository _repository;
//   UsuarioControllerBase(this._repository);

//   @observable
//   Usuario currentRecord = Usuario();

//   @observable
//   ObservableList<Usuario> dataProvider = ObservableList.of([]);

//   @readonly
//   UsuarioStatusState _status = UsuarioStatusState.initial;

//   @observable
//   String message = '';

//   @observable
//   @override
//   String searchCondition = '';

//   @override
//   @action
//   Future<void> findByCondition() async {
//     try {
//       _status = UsuarioStatusState.loading;
//       String sql = "1 = 1";
//       sql += " AND (NOME_USUARIO like '%$searchCondition%')";

//       List<Usuario> response = [];

//       response = await _repository.findByCondition(sql);
//       _status = UsuarioStatusState.loaded;
//       dataProvider = response.asObservable();
//     } on RepositoryException catch (e) {
//       _status = UsuarioStatusState.error;
//       message = e.message;
//     } catch (e) {
//       _status = UsuarioStatusState.error;
//       message = "No fue posible conectarse al servidor";
//     }
//   }

//   @action
//   Future<void> save() async {
//     try {
//       _status = UsuarioStatusState.loading;
//       currentRecord.senha = '123';
//       await _repository.save(currentRecord);
//       currentRecord = Usuario();
//       _status = UsuarioStatusState.succes;
//       message = 'Usuario guardado con Exito';
//     } on RepositoryException catch (e) {
//       _status = UsuarioStatusState.error;
//       message = e.message;
//     } catch (e) {
//       _status = UsuarioStatusState.error;
//       message = "No fue posible guardar el Usuario";
//     }
//   }

//   @action
//   @override
//   Future<void> insert() async {
//     currentRecord = Usuario();
//     _status = UsuarioStatusState.loading;
//     await Future.delayed(Duration.zero);
//     _status = UsuarioStatusState.insertOrUpdate;
//   }

//   @action
//   @override
//   Future<void> edit(Usuario usuario) async {
//     _status = UsuarioStatusState.loading;
//     await Future.delayed(Duration.zero);
//     _status = UsuarioStatusState.insertOrUpdate;
//   }
// }
