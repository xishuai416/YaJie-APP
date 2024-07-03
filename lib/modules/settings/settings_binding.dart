import 'package:get/get.dart';
import 'package:yajie_app/modules/settings/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    /* 设置 */
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
