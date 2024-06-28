import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = box.read("isLoggedIn") ?? false;
    username.value = box.read("username") ?? '';
  }

  void login(String user) {
    isLoggedIn.value = true;
    username.value = user;
    box.write("isLoggedIn", true);
    box.write("username", user);
  }

  void logout() {
    isLoggedIn.value = false;
    username.value = '';
    box.write("isLoggedIn", false);
    box.write("username", '');
  }
}