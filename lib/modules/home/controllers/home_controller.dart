import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:yajie_app/routes/app_pages.dart';
import 'package:yajie_app/utils/get_storage_controller.dart';
/// 主页控制器
/// - 描述：
class HomeController extends GetxController {
  final getStorageController = Get.find<GetStorageController>();
  void exit(){
    getStorageController.logout();
    Get.offAllNamed(Routes.LOGIN);
    _localNot();
  }
  void _localNot() {
    final notification = LocalNotification(
      // 用来生成通用唯一识别码
      identifier: '3025885',
      title: '测试',
      subtitle: '测试-YaJie',
      body: '桃之夭夭，灼灼其华。之子于归，宜其室家。\n桃之夭夭，有蕡其实。之子于归，宜其家室。\n桃之夭夭，其叶蓁蓁。之子于归，宜其家人。',
      // 用来设置是否静音
      silent: true,
      actions: [
        LocalNotificationAction(text: '测试1'),
        LocalNotificationAction(text: '测试2'),
      ],
    );
    notification.onShow = () {
      BotToast.showText(text: '显示了一条通知');
    };
    // TODO
    notification.onClose = (vale) {
      BotToast.showText(text: '通知已经关闭');
    };
    notification.onClick = () {
      BotToast.showText(text: '通知被点击了');
    };
    notification.onClickAction = (index) {
      BotToast.showText(text: '你点击了通知的第$index个选项');
    };
    notification.show();
  }
}
