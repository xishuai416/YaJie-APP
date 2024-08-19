import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:get/get.dart';
import 'package:yajie_app/components/dialog.dart';
import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/components/system_tray_manager.dart';
class WindowController extends GetxController with WindowListener{
  /// 获取主体
  BuildContext? context;

  /// 是否最大化
  RxBool isMaximized = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 软件启动日志输出
    LoggerManager().debug('软件启动中...');
    // print(fileDataController.filePath.value);

    // 监听关闭事件
    windowManager.addListener(this);
    _init();
  }

  @override
  void onReady() {
    super.onReady();
    // 软件启动日志输出
    LoggerManager().info('启动成功！');
  }

  @override
  void onClose() {
    super.onClose();
    // 销毁关闭事件监听
    windowManager.removeListener(this);
  }

  // 关闭窗口事件
  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();

    // 如果执行了关闭事件，并且列表不为空
    if (isPreventClose) {
      LoggerManager().debug('点击了软件的< × >（关闭）按钮');
      // 如果当前窗口为最小化状态，则恢复窗口以起到提醒作用
      bool isMinimized = await windowManager.isMinimized();
      if (isMinimized) {
        windowManager.restore();
      }

      // 监听确认框执行情况，如果点击了确认则真正关闭软件
      bool? popUpResults = await YJDialog.show(
        context!,
        title: '确认',
        content: '是否最小化至托盘，不退出程序？',
        lBtnText: "最小化至托盘",
        rBtnText: "退出",
      );

      if (popUpResults == null){
        LoggerManager().info('用户点击了外部区域或对话框被关闭');
      }else if (popUpResults) {
        // 退出运行
        LoggerManager().info('退出运行');
        SystemTrayManagerPage().destroyTrayManager();
        windowManager.destroy();
      } else {
        LoggerManager().debug('隐藏窗口');
        windowManager.hide();
      }
    }
  }

  /// 窗口最大化
  @override
  void onWindowMaximize() async {
    bool isMaximized = await windowManager.isMaximized();
    this.isMaximized.value = isMaximized;
    // LoggerManager().debug('窗口最大化');
  }

  /// 恢复窗口事件（拖动状态栏）
  @override
  void onWindowResize() async {
    bool isMaximized = await windowManager.isMaximized();
    this.isMaximized.value = isMaximized;
    // LoggerManager().debug('恢复窗口化（拖动状态栏）');
  }

  /// 窗口恢复事件（点击窗口化按钮）
  @override
  void onWindowUnmaximize() async {
    bool isMaximized = await windowManager.isMaximized();
    this.isMaximized.value = isMaximized;
    // LoggerManager().debug('恢复窗口化（点击窗口化按钮）');
  }

  /// 自定义方法：软件被关闭时截停并处理
  void _init() async {
    // 添加此行以覆盖默认关闭处理程序
    await windowManager.setPreventClose(true);
  }

  /// 自定义方法：窗口最大化/正常化状态变更
  void toggleMaximize() {
    isMaximized.value = !isMaximized.value;
  }
}