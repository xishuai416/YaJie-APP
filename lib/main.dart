import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yajie_app/bindings/all_binding.dart';
import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/components/system_tray_manager.dart';
import 'package:yajie_app/components/theme.dart';
import 'package:yajie_app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:yajie_app/utils/get_storage_controller.dart';
void main() async {
  if (!kIsWeb) {
    // 初始化日志系统
    await LoggerManager().initLogger();
    if(Platform.isLinux||Platform.isMacOS||Platform.isWindows){
      // 初始化 windowManager（一些软件基本参数）
      WidgetsFlutterBinding.ensureInitialized();
      // 必须加上这一行。
      await windowManager.ensureInitialized();
      WindowOptions windowOptions = const WindowOptions(
        minimumSize: Size(375, 667), //设置窗口的最小尺寸
        // maximumSize: Size(800, 600), //设置窗口的最大尺寸
        //window 设置窗口的初始尺寸
        size: Size(600,800),
        //窗口是否居中
        center: true,
        //设置窗口的背景色
        backgroundColor: Colors.transparent,
        //true 表示在状态栏不显示程序
        skipTaskbar: false,
        //true 表示设置Window一直位于最顶层
        alwaysOnTop: false,
        //hidden 表示隐藏标题栏 normal 显示标题栏
        titleBarStyle: TitleBarStyle.hidden,
        //设置窗口的标题，
        title: "YaJie APP",
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        //显示窗口
        await windowManager.show();
        //聚焦窗口
        await windowManager.focus();
        //ture设置窗口不可缩放 false 设置窗口可以缩放
        windowManager.setResizable(true);
        //设置窗口缩放宽高比
        // windowManager.setAspectRatio(1.3);
        //设置窗口是否支持阴影
        windowManager.setHasShadow(true);
        //设置窗口模式：亮色模式和暗色模式
        // windowManager.setBrightness(Brightness.dark);
      });
      await SystemTrayManagerPage().modifySystemTrayInfo("YaJie APP");
    }
  }
  await GetStorage.init();
  Get.put(GetStorageController());
  runApp(GetMaterialApp(
    themeMode: ThemeMode.system, // 主题模式
    theme: AppTheme.lightTheme(), // 浅色主题
    debugShowCheckedModeBanner: false,
    initialBinding: AllBinding(), // 初始化控制器
    title: "Application",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}