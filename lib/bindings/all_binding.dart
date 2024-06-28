import 'package:get/get.dart';
import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/utils/window_controller.dart';
class AllBinding extends Bindings {
  @override
  void dependencies() {
    LoggerManager().debug("初始化控制器");
    /* 窗口控制器 */
    // Get.lazyPut<WindowController>(() => WindowController());
    Get.put(WindowController());
  }
}
