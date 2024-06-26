import 'package:get/get.dart';
import 'package:yajie_app/components/logger_manager.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    LoggerManager().debug("初始化控制器");
  }
}
