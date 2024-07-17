import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajie_app/modules/food/food_view.dart';
import 'package:yajie_app/modules/home/home_binding.dart';
import 'package:yajie_app/modules/home/home_view.dart';
import 'package:yajie_app/modules/login/login_binding.dart';
import 'package:yajie_app/modules/login/login_view.dart';
import 'package:yajie_app/modules/medical/medical_view.dart';
import 'package:yajie_app/modules/menus/menus_view.dart';
import 'package:yajie_app/modules/settings/settings_view.dart';
import 'package:yajie_app/routes/middlewares/AuthMiddleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.MEDICAL:
        return GetPageRoute(
          settings: settings,
          page: () => const MedicalView(),
          middlewares: [AuthMiddleware()],
        );
      case _Paths.FOOD:
        return GetPageRoute(
          settings: settings,
          page: () => const FoodView(),
          middlewares: [AuthMiddleware()],
        );
      case _Paths.MENUS:
        return GetPageRoute(
          settings: settings,
          page: () => const MenusView(),
          middlewares: [AuthMiddleware()],
        );
      case _Paths.SETTINGS:
        return GetPageRoute(
          settings: settings,
          page: () => const SettingsView(),
          middlewares: [AuthMiddleware()],
        );
      default:
        return GetPageRoute(
          settings: settings,
          page: () => const Center(
            child: Text('功能正在开发中...'),
          ),
          middlewares: [AuthMiddleware()],
        );
    }
  }

}
