import 'package:get/get.dart';
import 'package:yajie_app/modules/home/home_binding.dart';
import 'package:yajie_app/modules/home/home_view.dart';
import 'package:yajie_app/modules/login/login_binding.dart';
import 'package:yajie_app/modules/login/login_view.dart';
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
}
