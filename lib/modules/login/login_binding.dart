import 'package:get/get.dart';
import 'package:yajie_app/modules/login/login_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    /* 首页 */
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
