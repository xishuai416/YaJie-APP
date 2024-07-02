import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/dao/login_dao.dart';

enum HttpMethod {
  GET,
  POST,
  PUT,
  DELETE,
}
////基础请求
abstract class BaseRequest {
  var pathParams;
  var useHttps = true;
  String authority(){
    return "api.devio.org";
  }
  HttpMethod httpMethod();
  String path();
  String url(){
    Uri uri;
    var pathStr = path();
    if(pathParams!=null){
      if(path().endsWith("/")){
        pathStr ="${path()}/$pathParams";
      }else{
        pathStr = "${path()}/$pathParams";
      }
    }
    if(useHttps){
      uri = Uri.https(authority(), pathStr,params);
    }else{
      uri = Uri.http(authority(), pathStr,params);
    }
    if(needLogin()){
      var bdPass = LoginDao.getAuthorization();
      addHeader(LoginDao.YJ_AUTHORIZATION, bdPass ??= "");
    }
    LoggerManager().debug('url:${uri.toString()}');
    return uri.toString();
  }
  bool needLogin();
  Map<String,dynamic> header = {
    'corse-flag': 'fa',
    "auth-token": 'MjAyMC0wNi0yMyAwMzoyNtowMQ==fa'
  };
  Map<String,dynamic> params = Map();

  BaseRequest add(String k,Object v){
    params[k] = v;
    return this;
  }
  BaseRequest addHeader(String k,Object v){
    header[k] = v;
    return this;
  }
}