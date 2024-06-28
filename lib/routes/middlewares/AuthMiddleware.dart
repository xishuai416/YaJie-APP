import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yajie_app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!false) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }

}