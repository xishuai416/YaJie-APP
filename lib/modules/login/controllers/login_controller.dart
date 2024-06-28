import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yajie_app/routes/app_pages.dart';

/// 主页控制器
/// - 描述：
class LoginController extends GetxController {
  final box = GetStorage();
  void login(){
    box.write('isLogin', true);
    Get.offAllNamed(Routes.HOME);
  }
}
