import 'package:get/get.dart';
import 'package:yajie_app/routes/app_pages.dart';
import 'package:yajie_app/utils/get_storage_controller.dart';

/// 主页控制器
/// - 描述：
class LoginController extends GetxController {
  final getStorageController = Get.find<GetStorageController>();
  void login(){
    getStorageController.login('yajie');
    Get.offAllNamed(Routes.HOME);
  }
}
