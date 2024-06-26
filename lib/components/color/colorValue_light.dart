import 'package:get/get.dart';

/// 自定义色值
RxMap<String, List<Map<String, int>>> value = {
  // 灰色
  'gray': <Map<String, int>>[
    {'r': 242, 'g': 243, 'b': 245},
    {'r': 224, 'g': 226, 'b': 230},
    {'r': 165, 'g': 169, 'b': 175},
    {'r': 121, 'g': 127, 'b': 135},
    {'r': 76, 'g': 84, 'b': 95},
    {'r': 31, 'g': 41, 'b': 55},
  ],

  // 主题色
  'primary': <Map<String, int>>[
    {'r': 233, 'g': 242, 'b': 255},
    {'r': 212, 'g': 229, 'b': 255},
    {'r': 169, 'g': 203, 'b': 255},
    {'r': 127, 'g': 178, 'b': 254},
    {'r': 84, 'g': 152, 'b': 254},
    {'r': 41, 'g': 126, 'b': 254},
  ],

  // 安全色
  'safety': <Map<String, int>>[],

  // 强调色
  'emphasize': <Map<String, int>>[],

  // 警告色
  'warning': <Map<String, int>>[],

  // 背景色
  'background': <Map<String, int>>[],

  // 会员色
  'vipColor': <Map<String, int>>[],
}.obs;
