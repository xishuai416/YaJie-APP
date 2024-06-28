import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajie_app/modules/login/controllers/login_controller.dart';
import 'package:yajie_app/utils/yj_appbar.dart';

/// 首页视图
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: YjAppbar(),

      // 内容部分
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('YaJie'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: const Text('登录'),
              ),
            ],
          ),
        ),
      )
    );
  }

}
