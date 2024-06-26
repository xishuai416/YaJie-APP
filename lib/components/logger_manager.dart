// ...
// 日志管理
// ...

import 'dart:convert';
import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

FileOutput fileOutPut = FileOutput();
ConsoleOutput consoleOutput = ConsoleOutput();
List<LogOutput> multiOutput = [fileOutPut, consoleOutput];
Logger logger = Logger(
  filter: DevelopmentFilter(),
  // Use the default LogFilter (-> only log in debug mode)
  // printer: SimplePrinter(
  //   colors: true,
  //   printTime: true,
  // ),
  printer: HybridPrinter(
    PrettyPrinter(
      noBoxingByDefault: false,
      methodCount: 2,
      // number of method calls to be displayed
      errorMethodCount: 8,
      // number of method calls if stacktrace is provided
      lineLength: 120,
      // width of the output
      colors: true,
      // Colorful log messages
      printEmojis: false,
      // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
    debug: SimplePrinter(),
  ),
);

/// Writes-the-log-output-to-a-file.
class FileOutput extends LogOutput {
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  File? file;
  String? _currentDate;

  FileOutput({
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  Future<void> getDirectoryForLogRecord() async {
    String currentDate = getCurrentDay();
    if (currentDate != _currentDate) {
      final String fileDir = await createDirectory();
      file = File('$fileDir/$currentDate.log');

      _sink = file!.openWrite(
        mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
        encoding: encoding,
      );

      _currentDate = currentDate;
    }
  }

  String getCurrentDay() {
    String currentDate = DateUtil.formatDate(DateTime.now(), format: "yyyyMMdd");
    return currentDate;
  }

  @override
  init() async {
    directoryLogRecord(onCallback: () {});
  }

  void directoryLogRecord({required Function onCallback}) {
    getDirectoryForLogRecord().whenComplete(() {
      onCallback();
    });
  }

  @override
  void output(OutputEvent event) {
    directoryLogRecord(onCallback: () {
      if (_sink != null) {
        if (Level.info == event.level || Level.warning == event.level || Level.error == event.level) {
          _sink?.writeAll(event.lines, '\n');
        }
      }
    });
  }

  @override
  destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}

Future<String> createDirectory() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  var file = Directory("${directory.path}/QiDian File Manager/logs"); // 创建文件夹(位置在用户 文档/QiDian File Manager 下)
  try {
    bool exist = await file.exists();
    if (exist == false) {
      await file.create();
    }
  } catch (e) {
    print("createDirectory error");
  }
  return file.path;
}

class LoggerManager {
  //私有构造函数
  LoggerManager._internal() {
    deleteLogsOfBefore7Day();
    initLogger();
  }

  //保存单例
  static final LoggerManager _singleton = LoggerManager._internal();

  //工厂构造函数
  factory LoggerManager() => _singleton;

  late Logger logger;

  // log初始化设置
  Future<void> initLogger() async {
    FileOutput fileOutPut = FileOutput();
    ConsoleOutput consoleOutput = ConsoleOutput();
    List<LogOutput> multiOutput = [fileOutPut, consoleOutput];
    logger = Logger(
      filter: DevelopmentFilter(),
      // Use the default LogFilter (-> only log in debug mode)
      // printer: SimplePrinter(
      //   colors: true,
      //   printTime: true,
      // ),
      printer: HybridPrinter(
        PrettyPrinter(
          noBoxingByDefault: false,
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: false,
          // Print an emoji for each log message
          printTime: true, // Should each log print contain a timestamp
        ),
        debug: SimplePrinter(),
      ),

      // printer: PrefixPrinter(PrettyPrinter(
      //   noBoxingByDefault: true,
      //   methodCount: 2,
      //   // number of method calls to be displayed
      //   errorMethodCount: 8,
      //   // number of method calls if stacktrace is provided
      //   lineLength: 120,
      //   // width of the output
      //   colors: true,
      //   // Colorful log messages
      //   printEmojis: false,
      //   // Print an emoji for each log message
      //   printTime: true, // Should each log print contain a timestamp
      // )),

      // printer: PrettyPrinter(
      //   noBoxingByDefault: true,
      //   methodCount: 2,
      //   // number of method calls to be displayed
      //   errorMethodCount: 8,
      //   // number of method calls if stacktrace is provided
      //   lineLength: 120,
      //   // width of the output
      //   colors: true,
      //   // Colorful log messages
      //   printEmojis: false,
      //   // Print an emoji for each log message
      //   printTime: true, // Should each log print contain a timestamp
      // ),
      // Use the PrettyPrinter to format and print log
      output: MultiOutput(
        multiOutput,
      ), // Use the default LogOutput (-> send everything to console)
    );
  }

  /// Debug 输出调试提示
  void debug(var message) {
    logger.d(message);
  }

  // verbose
  void verbose(var message) {
    // ignore: deprecated_member_use
    logger.v(message);
  }

  /// info 输出信息提示
  void info(var message) {
    logger.i(message);
  }

  /// warning 输出警报提示
  void warning(var message) {
    logger.w(message);
  }

  /// error 输出错误提示
  void error(var message) {
    logger.e(message);
  }

  // 每次启动只保留7天内的日志，删除7天前的日志
  Future<void> deleteLogsOfBefore7Day() async {
    final String fileDir = await createDirectory();

    // 获取目录的所有文件
    var dir = Directory(fileDir);
    Stream<FileSystemEntity> file = dir.list();
    await for (FileSystemEntity x in file) {
      // 获取文件的的名称
      List<String> paths = x.path.split('/');
      if (paths.isNotEmpty) {
        String logName = paths.last.replaceAll('.log', '');
        final logDate = DateUtil.getDateTime(logName);
        final currentDate = DateTime.now();
        //比较相差的天数
        if (logDate != null) {
          final difference = currentDate.difference(logDate).inDays;
          print("deleteLogsOfBefore7Day logDate:$logDate, currentDate:$currentDate, difference:$difference");
          if (difference > 7) {
            var file = File(x.path);
            // 删除文件
            file.delete();
          }
        }
      }
    }
  }
}
