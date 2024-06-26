import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    /* 首页 */
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
