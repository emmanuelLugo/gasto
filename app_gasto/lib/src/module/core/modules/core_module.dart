import 'package:app_gasto/src/core/dio/rest_client.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/file/controller/image_controller.dart';
import 'package:app_gasto/src/module/file/repository/image_repository.dart';
import 'package:app_gasto/src/module/file/services/image_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton(DataShared.new);
    i.addSingleton(RestClient.new);

    i.addSingleton(ImageRepository.new);
    i.addSingleton(ImageService.new);
    i.addSingleton(ImageController.new);
  }
}
