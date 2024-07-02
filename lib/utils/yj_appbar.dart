import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yajie_app/components/about.dart';
import 'package:yajie_app/components/dialog.dart';
import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/utils/window_controller.dart';

class YjAppbar extends StatelessWidget implements PreferredSizeWidget {
  final controller = Get.find<WindowController>();
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return _appbar(context);
  }

  // tab.1 软件窗口导航栏
  AppBar _appbar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,

      // DragToMoveArea: 拖动窗口组件
      title: DragToMoveArea(
        child: Container(
          width: double.infinity,
          height: 100,
          // color: Colors.amber,
          alignment: Alignment.center,

          // 导航栏按钮
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 左侧区域
              _leftButton(context),
              // 右侧区域
              kIsWeb||(!Platform.isLinux&&!Platform.isMacOS&&!Platform.isWindows)? const SizedBox(width: 0): _rightButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // 1.1 导航栏:左侧按钮列表
  Widget _leftButton(BuildContext context) {
    return Row(children: [
      // 设置按钮
      IconButton(
        // 隐藏反馈效果
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,

        // 按钮图标
        icon: Icon(
          Icons.menu,
          size: 24,
          color: Theme.of(context).colorScheme.onSecondary,
        ),

        // 按钮操作方法
        onPressed: () => YJDialogWindow.show(context, child: const About()),
      ),

      // 标题
      const SizedBox(width: 10),
      const Text(
        'YaJie',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(31, 41, 55, 1),
        ),
      ),
    ]);
  }

  // 1.2 导航栏:右侧按钮列表
  Widget _rightButton(BuildContext context) {
    return Row(children: [
      // 最小化窗口按钮
      IconButton(
        // 隐藏反馈效果
        highlightColor: Colors.grey[400],
        hoverColor: Colors.grey[300],
        icon: Icon(
          Icons.horizontal_rule_rounded,
          color: Theme.of(context).colorScheme.onSecondary,
          size: 20,
        ),

        // 点击事件
        onPressed: () {
          LoggerManager().debug('最小化窗口');
          windowManager.minimize();
        },
      ),

      // 最大化/恢复窗口按钮
      const Padding(padding: EdgeInsets.all(10)),
      IconButton(
        // 隐藏反馈效果
        highlightColor: Colors.grey[400],
        hoverColor: Colors.grey[300],

        icon: Obx(() => Icon(
          controller.isMaximized.value ? Icons.filter_none : Icons.crop_din,
          color: Theme.of(context).colorScheme.onSecondary,
          size: controller.isMaximized.value ? 14 : 16,
        )),

        // 点击事件
        onPressed: () async {
          // 判断窗口状态，并执行对应操作
          if (controller.isMaximized.value) {
            windowManager.restore();
          } else {
            windowManager.maximize();
          }
        },
      ),

      // 关闭窗口按钮
      const Padding(padding: EdgeInsets.all(10)),
      IconButton(
        // 隐藏反馈效果
        highlightColor: Colors.red[400],
        hoverColor: Colors.red[300],

        icon: Icon(
          Icons.clear_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 24,
        ),

        // 点击事件
        onPressed: () {
          windowManager.close();
        },
      ),
    ]);
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}