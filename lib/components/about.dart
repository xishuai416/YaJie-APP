/// 关于页面
library;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yajie_app/components/version.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部区域
          _header(context),

          // 使用手册显示区域
          const SizedBox(height: 20),
          _manual(context),

          // 版本号显示区域
          const SizedBox(height: 30),
          _version(context),

          // 内容详情区域
          const SizedBox(height: 10),
          _substance(context),
        ],
      ),
    );
  }

  // tab.2 页面组件

  /// 2.1抬头区域
  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '关于',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        // 关闭按钮
        IconButton(
          // 隐藏反馈效果
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,

          // 点击事件
          onPressed: () {
            Navigator.pop(context, false);
          },
          icon: Icon(
            Icons.clear_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 24,
          ),
        ),
      ],
    );
  }

  /// 2.2版本号显示区域
  Widget _version(BuildContext context) {
    return Text('版本号：v${Version.getVersion()}');
  }

  /// 2.3 内容详情区域
  Widget _substance(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 开源协议
        Row(
          children: [
            const Text('本项目使用'),
            InkWell(
              child: Text(
                ' MIT ',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onTap: () async {
                Uri url = Uri.parse('https://opensource.org/license/MIT');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            const Expanded(child: Text('开源协议，请自觉遵守相关条例。')),
          ],
        ),

        // 项目开源地址
        const SizedBox(height: 30),
        const Text('项目开源地址', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),

        // gitee
        Row(
          children: [
            const Text('gitee：', style: TextStyle(fontWeight: FontWeight.w800)),
            Expanded(
              child: InkWell(
                child: Text(
                  'https://gitee.com/xishuai416/YaJie-APP.git',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                onTap: () async {
                  Uri url = Uri.parse('https://gitee.com/xishuai416/YaJie-APP.git');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
            ),
          ],
        ),

        // github
        const SizedBox(height: 10),
        Row(
          children: [
            const Text('github：', style: TextStyle(fontWeight: FontWeight.w800)),
            Expanded(
              child: InkWell(
                child: Text(
                  'https://github.com/xishuai416/YaJie-APP.git',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                onTap: () async {
                  Uri url = Uri.parse('https://github.com/xishuai416/YaJie-APP.git');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 2.4 使用手册
  Widget _manual(BuildContext context) {
    return Row(children: [
      const Text('使用手册：', style: TextStyle(fontWeight: FontWeight.w800)),
      InkWell(
        child: Text('点击此处查看', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        onTap: () async {
          Uri url = Uri.parse('https://yajie.faifai.top');
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
      ),
    ]);
  }
}
