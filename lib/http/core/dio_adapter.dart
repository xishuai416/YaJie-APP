import 'package:dio/dio.dart';
import 'package:yajie_app/http/core/yj_error.dart';
import 'package:yajie_app/http/core/yj_net_adapter.dart';
import 'package:yajie_app/http/request/base_request.dart';

class DioAdapter extends YjNetAdapter {
  @override
  Future<YjNetResponse<T>> send<T>(BaseRequest request) async {
     var response,option = Options(headers: request.header);
     var error ;
     try{
       if (request.httpMethod()==HttpMethod.GET){
         response = await Dio().get(request.url(),options: option);
       }else if(request.httpMethod() == HttpMethod.POST){
         response = await Dio().post(request.url(),data: request.params,options: option);
       }else if(request.httpMethod() == HttpMethod.DELETE){
         response = await Dio().delete(request.url(),data: request.params,options: option);
       }
     }on DioException catch(e){
       error = e;
       response = e.response;
     }
     if(error != null){
       throw YjNetError(response?.statusCode ?? -1, error.toString(),data: buildRes(response,request));
     }
     return buildRes(response, request) as YjNetResponse<T>;
  }
  //构建HiNetResponse
  YjNetResponse buildRes(response, BaseRequest request) {
    return YjNetResponse(
      data: response.data,
      request: request,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response,
    );
  }
}