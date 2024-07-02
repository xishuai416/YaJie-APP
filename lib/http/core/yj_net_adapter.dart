
//网络请求抽象类
import 'dart:convert';

import '../request/base_request.dart';

abstract class YjNetAdapter{
  Future<YjNetResponse<T>> send<T>(BaseRequest request);
}
//统一网络层返回格式
class YjNetResponse<T>{
  T? data;
  bool? success;
  String? statusMessage;
  int? statusCode;
  dynamic extra;
  BaseRequest? request;
  YjNetResponse({this.data,this.request,this.success,this.statusMessage,this.statusCode=0,this.extra});
  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}