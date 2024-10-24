import 'dart:io';

import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/file/repository/image_repository.dart';

class ImageService {
  final ImageRepository _repository;
  ImageService(
    this._repository,
  );

  Future<String?> uploadImageProduct(File file) async {
    try {
      final response = await _repository.uploadImage(file);
      return response;
    } on RepositoryException catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }
}
