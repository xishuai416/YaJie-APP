import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:yajie_app/dao/login_dao.dart';
import 'package:yajie_app/routes/app_pages.dart';
/// 主页控制器
/// - 描述：
class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var isExpend = false.obs;
  @override
  void onInit() {
    super.onInit();
  }
  void onTap(int index) {
    selectedIndex.value = index;
    // BotToast.showText(text: '你点击了第$index个选项');
    switch(index){
      case 0:
        Get.toNamed('/medical',id: 1);
        break;
      case 1:
        Get.toNamed('/food',id: 1);
        break;
      case 2:
        Get.toNamed('/menus',id: 1);
        break;
      case 3:
        Get.toNamed('/settings',id: 1);
        break;
      default:
        break;
    }
  }
  void exit()async{
    var cancel =BotToast.showLoading();
    var result = await LoginDao.logout();
    cancel();
    if (result) {
      Get.offAllNamed(Routes.LOGIN);
      BotToast.showText(text: "退出成功");
    }else{
      BotToast.showText(  text: '注销请求失败！');
    }
  }
}
