import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajie_app/modules/home/home_controller.dart';
import 'package:yajie_app/routes/app_pages.dart';
import 'package:yajie_app/components/yj_appbar.dart';

/// 首页视图
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: YjAppbar(),
      // 内容部分
      body: LayoutBuilder(
        builder: (context, constraints) {
         if (constraints.maxWidth < constraints.maxHeight && constraints.maxWidth<500){
           return Obx(() => Scaffold(
             body: _getAppBar(),
             bottomNavigationBar: BottomNavigationBar(
               items: items,
               currentIndex: controller.selectedIndex.value,
               selectedItemColor: Colors.amber[500],
               onTap: controller.onTap,
             ),
           ));
         }else{
           return Obx(() => Row(
             mainAxisSize: MainAxisSize.max,
             children: [
               NavigationRail(
                 selectedIndex: controller.selectedIndex.value,
                 onDestinationSelected: controller.onTap,
                 labelType: controller.isExpend.value?NavigationRailLabelType.none:NavigationRailLabelType.all,
                 selectedIconTheme: IconThemeData(color: Colors.amber[500]),
                 selectedLabelTextStyle: TextStyle(color: Colors.amber[500],fontFamily: 'QTxiaotu'),
                 elevation: 10,
                 minWidth: 66,
                 minExtendedWidth:88,
                 extended: controller.isExpend.value,
                 useIndicator: false,
                 leading: _buildLeading(),
                 destinations: destinations,
                 trailing: Expanded(
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: Padding(
                       padding: const EdgeInsets.only(bottom: 20.0),
                       child: IconButton(
                         icon: Image.asset('assets/images/app_icon.png',
                         width: 45),
                         onPressed: () {
                           BotToast.showText(text: "你点我最好有事情！");
                         },
                       ),
                     ),
                   ),
                 ),
               ),
               Expanded(
                 child: _getAppBar(),
               ),
             ],
           ));
         }
        }
      ),
    );
  }
  Widget _buildLeading(){
    return Builder(
      builder: (context) {
        return IconButton(
          icon: Obx(()=>Icon(controller.isExpend.value?Icons.menu_open:Icons.menu)),
          onPressed: () {
            controller.isExpend.value = !controller.isExpend.value;
          },
        );
      },
    );
  }
  Widget _getAppBar() {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: Routes.MEDICAL,
      onGenerateRoute: AppPages.generateRoute,
    );
  }
  final List<NavigationRailDestination> destinations = const [
    NavigationRailDestination(
      icon: Icon(Icons.medical_services),
      label: Text('药品'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.egg_alt),
      label: Text('食品'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.menu_book),
      label: Text('菜谱'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.settings_outlined),
      label: Text('设置'),
    ),
  ];
  final List<BottomNavigationBarItem> items = const [
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
  ];
}
