// 主题文件 (关于flutter主题的详细介绍可查看：https://book.flutterchina.club/chapter7/theme.html#_7-4-2-%E4%B8%BB%E9%A2%98-theme)

import 'package:flutter/material.dart';
import 'package:yajie_app/components/color/colorPalette.dart';
// Top.1 主题
class AppTheme {
  // 浅色主题
  static ThemeData lightTheme() {
    return ThemeData(
        fontFamily: 'QTxiaotu',
        splashColor: Colors.transparent, // 点击背景水波纹效果设为透明
        // 文字主题
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colorpalette.gray()),
            bodyMedium: TextStyle(color: Colorpalette.gray()),
            bodySmall: TextStyle(color: Colorpalette.gray()),
            ),

        // App 导航栏
        appBarTheme: AppBarTheme(
          backgroundColor: Colorpalette.backgroundColor(), // 背景色

          // 设置图标样式
          iconTheme: IconThemeData(
            color: Colorpalette.gray(), // 设置图标颜色
            ),
        ),

        // 按钮样式
        // textButtonTheme: TextButtonThemeData(
        //   style: ButtonStyle(
        //     foregroundColor: WidgetStateProperty.resolveWith((states) => Colorpalette.gray()), // 设置按钮文字颜色
        //   ),
        // ),

        // 底部导航栏
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0, // 取消底部导航栏的阴影
          backgroundColor: Colors.white, // 底部导航栏背景色
          selectedItemColor: Colorpalette.primary(), // 被选中的颜色
          unselectedItemColor: Colorpalette.gray(levels: 4), // 未选中的颜色
        ),

        // 卡片样式
        cardTheme: const CardTheme(
          shadowColor: Color.fromRGBO(0, 0, 0, 0.05), // 阴影颜色
        ),
        cardColor: Colorpalette.gray(levels: 1), // 代用于：分割线颜色

        // 底部浮动按钮
        floatingActionButtonTheme: const FloatingActionButtonThemeData(),
        dataTableTheme: const DataTableThemeData(),

        // 色彩大全
        // colorScheme: ColorScheme(
        //   brightness: Brightness.light,
        //   primary: Colorpalette.primary(), // 主要色
        //   secondary: Colorpalette.safety(), // 次要色
        //   primaryContainer: Colors.white, // 主要容器背景色
        //   secondaryContainer: Colors.black, // 次要容器背景色
        //   error: Colorpalette.emphasize(levels: 4), // 错误色
        //   onError: Colorpalette.warning(),
        //   onPrimary: Colorpalette.gray(), // 主要字体颜色
        //   onSecondary: Colorpalette.gray(levels: 3), // 次要字体颜色
        //   onSurface: Colorpalette.gray(), // 标题字体色
        //   surface: Colorpalette.backgroundColor(), // 标题字体色背景（appBar背景色）
        // )
    );
  }

  // 深色主题
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark, // 深色主题
    );
  }
}
