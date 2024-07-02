
import 'package:yajie_app/http/core/yj_net_adapter.dart';
import 'package:yajie_app/http/request/base_request.dart';

class MockAdapter extends YjNetAdapter{
  @override
  Future<YjNetResponse<T>> send<T>(BaseRequest request) async {
    // 模拟 1 秒延迟
    await Future.delayed(Duration(milliseconds: 1000));

    return YjNetResponse<T>(
      data: {"code": 0, "message": "success","data":"123456"} as T,
      statusCode: 200,
    );
  }
}