import 'package:get/get.dart';
import 'package:yajie_app/modules/menus/menus_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    /* 菜谱 */
    Get.lazyPut<MenusController>(() => MenusController());
  }
}
