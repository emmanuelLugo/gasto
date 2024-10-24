import 'dart:io';
import 'package:app_gasto/src/core/dio/rest_client.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class ImageRepository {
  final RestClient restClient;
  ImageRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<String> uploadImage(File file) async {
    try {
      final String filePatch = file.path;
      final String fileName = path.basename(file.path);
      final FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(filePatch, filename: fileName),
      });
      final response = await restClient.post(
        "/file/upload",
        data: formData,
        headers: {'Content-Type': 'multipart/form-data'},
      );
      if (kDebugMode) {
        print(response.data['message']);
      }
      return response.data['message'];
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
