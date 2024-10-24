import 'dart:io';

import 'package:app_venda/src/core/exceptions/service_exception.dart';
import 'package:app_venda/src/module/file/services/image_service.dart';

class ImageController {
  final ImageService _service;
  ImageController(
    this._service,
  );

  Future<String?> uploadImageProduct(File file) async {
    try {
      final response = await _service.uploadImageProduct(file);
      return response;
    } on ServiceException catch (e) {
      throw Future.error(e);
    }
  }
}
