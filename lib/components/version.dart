// 版本号管理

class Version {
  static const int majorVersion = 2; // 主版本内号
  static const int subversions = 0; // 子版本号
  static const int stageVersions = 0; // 阶段版本号

  // 版本号示例：2.0.0
  static String getVersion() {
    return '$majorVersion.$subversions.$stageVersions';
  }
}
