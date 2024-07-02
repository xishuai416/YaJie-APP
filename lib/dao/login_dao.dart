import 'package:bot_toast/bot_toast.dart';
import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/http/core/yj_net.dart';
import 'package:yajie_app/http/request/logout_request.dart';
import 'package:yajie_app/http/request/registration_request.dart';
import 'package:yajie_app/utils/yj_cache.dart';
import '../http/request/base_request.dart';
import '../http/request/login_request.dart';

class LoginDao{
  static const YJ_AUTHORIZATION = "Authorization";
  static const YJ_USERNAME = "username";
  static const YJ_PASSWORD = "password";
  static const YJ_ISLOGIN = "islogin";
  static login(String userName,String password){
    return _send(userName,password);
  }
  static logout(){
    return _logout();
  }
  static registration(String userName,String password,String imoocId,String orderId){
    return _send(userName,password,imoocId: imoocId,orderId: orderId);
  }

  static _send(String userName, String password,{imoocId,orderId})async {
    BaseRequest request;
    if(imoocId != null && orderId != null){
      request = RegistrationRequest();
    }else{
      request = LoginRequest();
    }
    request
        .add("userName", userName)
        .add("password",password )
        .add("imoocId",imoocId??="null" )
        .add("orderId",orderId??="null" );
    var result = await YjNet.getInstance()?.fire(request);
    LoggerManager().debug(result);
    if (result["code"]==0&&result["data"] != null){
      YjCache().write(YJ_AUTHORIZATION, result["data"]);
      YjCache().write(YJ_USERNAME, userName);
      YjCache().write(YJ_PASSWORD, password);
      YjCache().write(YJ_ISLOGIN, true);
      return true;
    }
    return false;
  }
  static _logout()async {
    BaseRequest request= LogoutRequest();
    var result = await YjNet.getInstance()?.fire(request);
    LoggerManager().debug(result);
    if (result["code"]==0&&result["data"] != null){
      YjCache().write(YJ_AUTHORIZATION, "");
      YjCache().write(YJ_ISLOGIN, false);
      return true;
    }
    return false;
  }
  static getAuthorization(){
    return YjCache().read(YJ_AUTHORIZATION)??"";
  }
  static getUserName(){
    return YjCache().read(YJ_USERNAME)??"";
  }
  static getPassWord(){
    return YjCache().read(YJ_PASSWORD)??"";
  }
  static getIsLogin(){
    return YjCache().read(YJ_ISLOGIN)??false;
  }
}