import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';
class SystemTrayManagerPage{
  Timer? _timer;
  bool _hasIcon = false;
  final SystemTray _systemTray = SystemTray();
  final String _iconPathWin = 'assets/images/app_icon.ico';
  final String _iconPathOther = 'assets/images/app_icon.png';
  void generateIcon() async {
    await _systemTray.initSystemTray(
      title: "下位机模拟程序",
      toolTip: "下位机模拟程序",
      iconPath: Platform.isWindows ? _iconPathWin : _iconPathOther,
    );
    _systemTray.registerSystemTrayEventHandler((eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? showWindow() : _systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? _systemTray.popUpContextMenu() : showWindow();
      }
    });
    _hasIcon = true;
  }
  void showWindow(){
    windowManager.show();
    windowManager.restore();
  }
  void iconFlash() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      if (_hasIcon) {
        await _systemTray
            .setImage("");
      } else {
        await _systemTray
            .setImage(Platform.isWindows ? _iconPathWin : _iconPathOther);
      }
      _hasIcon = !_hasIcon;
    });
  }

  void initState() {
    generateIcon();
    generateContextMenu();
  }

  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
  }

  void closeIconFlash() {
    _timer?.cancel();
    _systemTray
        .setImage(Platform.isWindows ? _iconPathWin : _iconPathOther);
    _hasIcon = true;
  }

  void generateToolTip(String toolTip) async {
    await _systemTray.setToolTip(toolTip);
  }

  void generateContextMenu() async {
    Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(
        label: '显示',
        onClicked: (menuItem) {
          windowManager.show();
          windowManager.restore();
        },
      ),
      MenuItemLabel(
        label: '隐藏',
        onClicked: (menuItem) {
          windowManager.hide();
        },
      ),
      MenuSeparator(),
      MenuItemLabel(
        label: '退出程序',
        onClicked: onTrayMenuItemClick,
      ),
    ]);
    await _systemTray.setContextMenu(menu);
  }

  void destroyTrayManager() async {
    await _systemTray.destroy();
  }

  void onTrayMenuItemClick(MenuItemBase menuItem) async {
        destroyTrayManager();
        await windowManager.destroy();
  }
}
