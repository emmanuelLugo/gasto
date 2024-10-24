import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  LocalStorageService._();

  final _secureStorage = const FlutterSecureStorage();

  static LocalStorageService get instance =>
      _instance ??= LocalStorageService._();

  Future<String?> get({required String key}) async =>
      await _secureStorage.read(key: key);

  Future<void> delete({required String key}) async =>
      await _secureStorage.delete(key: key);

  Future<void> deleteAll() async => await _secureStorage.deleteAll();

  Future<void> write({required String key, required String? value}) async =>
      await _secureStorage.write(key: key, value: value);
}
