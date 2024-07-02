class NeedLogin extends YjNetError {
  NeedLogin({int code= 401,String message= "需要登录"}) : super(code,message);
}
class NeedAuth extends YjNetError{
  NeedAuth(String message,{int code= 403,dynamic data}):super(code,message,data: data);
}
class YjNetError implements Exception{
  final String message;
  final int code;
  final dynamic data;
  YjNetError(this.code,this.message,{this.data});
}