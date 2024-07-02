import 'package:yajie_app/components/logger_manager.dart';
import 'package:yajie_app/http/core/mock_adapter.dart';
import 'package:yajie_app/http/core/yj_error.dart';
import 'package:yajie_app/http/core/yj_net_adapter.dart';
import 'package:yajie_app/http/request/base_request.dart';

class YjNet {
  YjNet._();
  static YjNet? _instance;
  static YjNet? getInstance() {
    _instance ??= YjNet._();
    return _instance;
  }
  Future fire(BaseRequest request) async{
    YjNetResponse? response;
    var error;
    try{
     response = await send(request);
    }on YjNetError catch(e){
      error = e;
      response = e.data;
    }catch(e){
      error = e;
      LoggerManager().error(e);
    }
    if (response == null){
      LoggerManager().error(error);
    }else{
      var result = response.data;
      LoggerManager().debug(result);
      var status = response.statusCode;
      switch(status){
        case 200:
          return result;
        case 401:
          throw NeedLogin();
        case 402:
          throw NeedAuth(result['message'],data: result);
        default:
          throw YjNetError(status!,result.toString(),data: result);
      }
    }
  }
  Future<dynamic> send<T>(BaseRequest request) async{
    //使用Mock发送请求
    YjNetAdapter adapter = MockAdapter();// DioAdapter();
    return adapter.send(request);
  }
}