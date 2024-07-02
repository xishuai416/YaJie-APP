import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/dao/login_dao.dart';
import 'package:yajie_app/routes/app_pages.dart';

/// 主页控制器
/// - 描述：
class LoginController extends GetxController {
  void login()async{
    var cancel =BotToast.showLoading();
    var result =await LoginDao.login('yajie',"password");
    cancel();
    if (result) {
      Get.offAllNamed(Routes.HOME);
      BotToast.showText(text: "登陆成功");
    }
    else{
      BotToast.showText(text: "登陆请求失败");
      LoggerManager().error("登录失败");
    }
  }
}
