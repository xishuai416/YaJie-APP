/// 首页页眉部分
/// - 描述：
library;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatefulWidget {
  /// 首页页眉
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  // tab.1 构建界面
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        const Text(
          '首页',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal),
        ),
        const SizedBox(width: 10),
        const Text(
          '|',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
