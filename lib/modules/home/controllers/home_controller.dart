import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yajie_app/routes/app_pages.dart';
/// 主页控制器
/// - 描述：
class HomeController extends GetxController {
  final box = GetStorage();
  void exit(){
      box.write("isLogin", false);
      Get.offAllNamed(Routes.LOGIN);
  }
}
