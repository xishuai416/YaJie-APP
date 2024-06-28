import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yajie_app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  final box = GetStorage();
  @override
  RouteSettings? redirect(String? route) {
    var isLogin = box.read<bool>("isLogin");
    isLogin ??= false;
    if (!isLogin) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}