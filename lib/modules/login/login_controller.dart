import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/dao/login_dao.dart';
import 'package:yajie_app/routes/app_pages.dart';

/// 主页控制器
/// - 描述：
class LoginController extends GetxController {
  var pwdShow = true.obs;
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    unameController.text = LoginDao.getUserName();
    pwdController.text = LoginDao.getPassWord();
  }

  void login()async{
    // 先验证各个表单字段是否合法
    if ((formKey.currentState as FormState).validate()){
      var cancel =BotToast.showLoading();
      var result =await LoginDao.login(unameController.text,pwdController.text);
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
}
