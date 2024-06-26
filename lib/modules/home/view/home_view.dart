import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yajie_app/components/about.dart';
import 'package:yajie_app/components/dialog.dart';
import 'package:yajie_app/components/home/header.dart';
import 'package:yajie_app/components/home/home_body.dart';
import 'package:yajie_app/components/logger_manager.dart';
import '../controllers/home_controller.dart';

/// 首页视图
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      // 导航栏
      appBar: _appbar(context),

      // 内容部分
      body: const Column(
        children: [
          // HomeHeader(),
          // HomeBody(),
        ],
      ),
    );
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
              _rightButton(context),
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
          fontFamily: '微软雅黑',
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
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        icon: Icon(
          Icons.horizontal_rule_rounded,
          color: Theme.of(context).colorScheme.onSecondary,
          size: 20,
        ),

        // 点击事件
        onPressed: () {
          LoggerManager().verbose('最小化窗口');
          windowManager.minimize();
        },
      ),

      // 最大化/恢复窗口按钮
      const Padding(padding: EdgeInsets.all(10)),
      IconButton(
        // 隐藏反馈效果
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,

        icon: Obx(() => Icon(
              controller.isMaximized.value ? Icons.filter_none : Icons.crop_din,
              color: Theme.of(context).colorScheme.onSecondary,
              size: controller.isMaximized.value ? 14 : 16,
            )),

        // 点击事件
        onPressed: () async {
          await YJDialog.show(context, title: 'title', content: 'content');
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
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,

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
}
