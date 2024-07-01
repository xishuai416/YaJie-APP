import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if(settings.name == '/'){
            return GetPageRoute(
              settings: settings,
              page: () => Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.exit();
                  },
                  child: Text('主页'),
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Obx(() =>BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '业务',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '设置',
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Colors.amber[800],
        onTap: controller.onTap,
      ),
      )
    );
  }
}
