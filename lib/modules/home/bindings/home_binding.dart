import 'package:get/get.dart';
import 'package:yajie_app/modules/home/controllers/home_controller.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    /* 首页 */
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
