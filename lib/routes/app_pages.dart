import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajie_app/modules/food/food_binding.dart';
import 'package:yajie_app/modules/food/food_view.dart';
import 'package:yajie_app/modules/home/home_binding.dart';
import 'package:yajie_app/modules/home/home_view.dart';
import 'package:yajie_app/modules/login/login_binding.dart';
import 'package:yajie_app/modules/login/login_view.dart';
import 'package:yajie_app/modules/medical/medical_binding.dart';
import 'package:yajie_app/modules/medical/medical_view.dart';
import 'package:yajie_app/modules/menus/menus_binding.dart';
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
  static final secondroutes = [
    GetPage(
      name: Routes.MEDICAL,
      page: () => const MedicalView(),
      binding: MedicalBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.FOOD,
      page: () => const FoodView(),
      binding: FoodBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.MENUS,
      page: () => const MenusView(),
      binding: MenusBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      middlewares: [AuthMiddleware()],
    ),
  ];
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // 通过路由名称查找路由配置
    final route = secondroutes.firstWhere(
          (r) => r.name == settings.name,
      orElse: () => secondroutes.last, // 默认路由
    );
    return GetPageRoute(
      settings: settings,
      page: route.page,
      binding: route.binding,
      middlewares: route.middlewares,
    );
  }
}
