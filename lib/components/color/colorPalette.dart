import 'package:flutter/material.dart';
import 'colorValue_light.dart';

/// ### 基础色板
/// 以下是基础色板的说明。
/// #### 通用属性说明：
/// - levels: 色阶 (由深至浅 5~0)
/// - opacity: 不透明度，默认为由深至浅 1~0
/// #### 颜色列表
/// - gray: 主题灰色
/// - blue: 主题蓝色
/// - green: 主题绿色
/// - red: 主题红色
/// - orange: 主题橙色
/// - backgroundColor: 背景色
/// - vipColor: 会员色

class Colorpalette {
  // 色板值
  Map<String, List<Map<String, int>>> colorValues = {};
  Colorpalette(this.colorValues);

  /// 灰色（根据用户填写的色阶自适应颜色，如果没有填写，默认色阶为5）
  static Color gray({int levels = 5, double opacity = 1.0}) {
    // 获取色值
    var yjColor = Colorpalette(value);
    var gray = yjColor.colorValues['gray']!;

    // 自定义颜色
    switch (levels) {
      case 5:
        return Color.fromRGBO(gray[5]['r']!, gray[5]['g']!, gray[5]['b']!, opacity);
      case 4:
        return Color.fromRGBO(gray[4]['r']!, gray[4]['g']!, gray[4]['b']!, opacity);
      case 3:
        return Color.fromRGBO(gray[3]['r']!, gray[3]['g']!, gray[3]['b']!, opacity);
      case 2:
        return Color.fromRGBO(gray[2]['r']!, gray[2]['g']!, gray[2]['b']!, opacity);
      case 1:
        return Color.fromRGBO(gray[1]['r']!, gray[1]['g']!, gray[1]['b']!, opacity);
      case 0:
        return Color.fromRGBO(gray[0]['r']!, gray[0]['g']!, gray[0]['b']!, opacity);
      default:
        return Color.fromRGBO(gray[5]['r']!, gray[5]['g']!, gray[5]['b']!, opacity);
    }
  }

  // 主题色（默认蓝色，根据用户填写的色阶自适应颜色，如果没有填写，默认色阶为4）
  static Color primary({int levels = 4, double opacity = 1.0}) {
    // 获取色值
    var yjColor = Colorpalette(value);
    var primary = yjColor.colorValues['primary']!;

    switch (levels) {
      case 5:
        return Color.fromRGBO(primary[5]['r']!, primary[5]['g']!, primary[5]['b']!, opacity);
      case 4:
        return Color.fromRGBO(primary[4]['r']!, primary[4]['g']!, primary[4]['b']!, opacity);
      case 3:
        return Color.fromRGBO(primary[3]['r']!, primary[3]['g']!, primary[3]['b']!, opacity);
      case 2:
        return Color.fromRGBO(primary[2]['r']!, primary[2]['g']!, primary[2]['b']!, opacity);
      case 1:
        return Color.fromRGBO(primary[1]['r']!, primary[1]['g']!, primary[1]['b']!, opacity);
      case 0:
        return Color.fromRGBO(primary[0]['r']!, primary[0]['g']!, primary[0]['b']!, opacity);
      default:
        return Color.fromRGBO(primary[4]['r']!, primary[4]['g']!, primary[4]['b']!, opacity);
    }
  }

  /// 安全色（默认绿色，根据用户填写的色阶自适应颜色，如果没有填写，默认色阶为4）
  static Color safety({int levels = 4, double opacity = 1.0}) {
    switch (levels) {
      case 5:
        return Color.fromRGBO(7, 193, 96, opacity);
      case 4:
        return Color.fromRGBO(57, 205, 128, opacity);
      case 3:
        return Color.fromRGBO(106, 218, 160, opacity);
      case 2:
        return Color.fromRGBO(156, 230, 191, opacity);
      case 1:
        return Color.fromRGBO(205, 243, 223, opacity);
      case 0:
        return Color.fromRGBO(230, 249, 239, opacity);
      default:
        return Color.fromRGBO(57, 205, 128, opacity);
    }
  }

  /// 强调色（默认红色，根据用户填写的色阶自适应颜色，如果没有填写，默认色阶为4）
  static Color emphasize({int levels = 4, double opacity = 1.0}) {
    switch (levels) {
      case 5:
        return Color.fromRGBO(247, 76, 48, opacity);
      case 4:
        return Color.fromRGBO(249, 112, 89, opacity);
      case 3:
        return Color.fromRGBO(250, 148, 131, opacity);
      case 2:
        return Color.fromRGBO(252, 183, 172, opacity);
      case 1:
        return Color.fromRGBO(253, 219, 214, opacity);
      case 0:
        return Color.fromRGBO(254, 237, 234, opacity);
      default:
        return Color.fromRGBO(249, 112, 89, opacity);
    }
  }

  /// 警告色（默认橙色，根据用户填写的色阶自适应颜色，如果没有填写，默认色阶为4）
  static Color warning({int levels = 5, double opacity = 1.0}) {
    switch (levels) {
      case 5:
        return Color.fromRGBO(255, 141, 64, opacity);
      case 4:
        return Color.fromRGBO(255, 164, 102, opacity);
      case 3:
        return Color.fromRGBO(255, 187, 140, opacity);
      case 2:
        return Color.fromRGBO(255, 209, 179, opacity);
      case 1:
        return Color.fromRGBO(255, 232, 217, opacity);
      case 0:
        return Color.fromRGBO(255, 243, 236, opacity);
      default:
        return Color.fromRGBO(255, 164, 102, opacity);
    }
  }

  /// 背景色
  /// - light: 浅色背景
  /// - dark: 深色背景
  static Color backgroundColor({String brightness = 'light', double opacity = 1.0}) {
    switch (brightness) {
      case 'light':
        return Color.fromRGBO(245, 247, 250, opacity);
      case 'dark':
        return Color.fromRGBO(15, 15, 15, opacity);
      default:
        return Color.fromRGBO(245, 247, 250, opacity);
    }
  }

  /// 会员色
  static Color vipColor({String brightness = 'light', double opacity = 1.0}) {
    return Color.fromRGBO(255, 229, 179, opacity);
  }
}
