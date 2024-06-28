import 'package:get/get.dart';
import 'package:yajie_app/routes/app_pages.dart';
import 'package:yajie_app/utils/get_storage_controller.dart';
/// 主页控制器
/// - 描述：
class HomeController extends GetxController {
  final getStorageController = Get.find<GetStorageController>();
  void exit(){
    getStorageController.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
