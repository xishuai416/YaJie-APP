import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yajie_app/routes/app_pages.dart';
import 'package:yajie_app/utils/get_storage_controller.dart';

class AuthMiddleware extends GetMiddleware {
  final getStorageController = Get.find<GetStorageController>();
  @override
  RouteSettings? redirect(String? route) {
    if (!getStorageController.isLoggedIn.value) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}