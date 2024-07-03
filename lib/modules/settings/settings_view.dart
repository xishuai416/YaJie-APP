import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajie_app/modules/settings/settings_controller.dart';

/// 首页视图
class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("设置");
  }

}
