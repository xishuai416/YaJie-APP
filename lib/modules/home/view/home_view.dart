import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajie_app/components/home/header.dart';
import 'package:yajie_app/modules/home/controllers/home_controller.dart';
import 'package:yajie_app/utils/yj_appbar.dart';

/// 首页视图
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: YjAppbar(),
      // 内容部分
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.exit();
          },
          child: Text('主页'),
        ),
      ),
    );
  }


}
