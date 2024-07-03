import 'package:get/get.dart';
import 'package:yajie_app/modules/medical/medical_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    /* 药品 */
    Get.lazyPut<MedicalController>(() => MedicalController());
  }
}
