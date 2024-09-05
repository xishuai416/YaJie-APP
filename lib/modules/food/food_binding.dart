import 'package:get/get.dart';
import 'package:yajie_app/modules/food/food_controller.dart';

class FoodBinding extends Bindings {
  @override
  void dependencies() {
    /* 食品 */
    Get.lazyPut<FoodController>(() => FoodController());
  }
}
