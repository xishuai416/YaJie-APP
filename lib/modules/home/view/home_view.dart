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
        initialRoute: '/medical',
        onGenerateRoute: (settings) {
          switch(settings.name){
            case "/medical":
              return GetPageRoute(
                settings: settings,
                page: () => Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.exit();
                    },
                    child: Text('药品'),
                  ),
                ),
              );
            case "/food":
              return GetPageRoute(
                settings: settings,
                page: () => Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.exit();
                    },
                    child: Text('食品'),
                  ),
                ),
              );
            case "/menu":
              return GetPageRoute(
                settings: settings,
                page: () => Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.exit();
                    },
                    child: Text('菜谱'),
                  ),
                ),
              );
            case "/settings":
            return GetPageRoute(
              settings: settings,
              page: () => Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.exit();
                  },
                  child: Text('设置'),
                ),
              ),
            );
            default:
             break;
          }
        },
      ),
      bottomNavigationBar: Obx(() =>BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: '药品',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.egg_alt),
            label: '食品',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '菜谱',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
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
