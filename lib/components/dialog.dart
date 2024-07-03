import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// 弹窗提示
class YJDialog {
  /// 标题
  final String title;

  /// 弹窗文字内容
  final String content;

  /// 弹窗是否可取消
  final bool cancellable;

  /// 自定义内容组件
  final Widget? child;

  final String rBtnText;

  final String lBtnText;
  const YJDialog({
    required this.title,
    this.content = '默认内容',
    this.cancellable = true,
    this.child,
    this.lBtnText = "取消",
    this.rBtnText = "确认",
  });

  static Future<bool> show(
    context, {
    /// 标题
    required String title,

    /// 弹窗文字内容
    String content = '内容',

    /// 弹窗是否可取消
    bool cancellable = true,

    /// 自定义内容组件
    Widget? child,

    /// 自定义方法
    Function? function,

    /// 是否允许点击遮罩层关闭
    bool barrierDismissible = true,
    /// 左侧按钮文本
    String lBtnText = '取消',
    /// 右侧侧按钮文本
    String rBtnText = '确认',
  }) async {
    // 实例化对象
    YJDialog yjDialog = YJDialog(
      title: title,
      content: content,
      cancellable: cancellable,
      child: child,
      lBtnText: lBtnText,
      rBtnText: rBtnText,
    );
    // 执行回调方法
    if (function != null) function();

    bool res = await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => yjDialog.dialog(context),
    );

    return res;
  }

  // 弹窗内容
  Widget dialog(context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),

          // 标题
          title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          // 内容区域
          content: child ?? Text(content),

          // 按钮组，自定义增加按钮数量
          actions: [
            // 取消按钮
            Visibility(
              visible: cancellable, // 组件显示/隐藏
              child: TextButton(
                  onPressed: () {
                    // 关闭弹窗，pop() 中传入的参数将会作为返回值，需配合异步使用
                    Navigator.pop(context, false);
                  },
                  child: Text(lBtnText)),
            ),

            // 确定按钮
            TextButton(
                onPressed: () {
                  // 关闭弹窗，pop() 中传入的参数将会作为返回值，需配合异步使用
                  Navigator.pop(context, true);
                },
                child: Text(rBtnText)),
          ],
        ),

        // 添加一个拖动区域，用于拖动窗口
        Positioned(
          top: 0,
          left: 0,
          child: DragToMoveArea(child: SizedBox(width: size.width, height: 50)),
        )
      ],
    );
  }
}

/// 弹出窗口
class YJDialogWindow {
  /// 自定义内容组件
  final Widget? child;

  /// 弹窗是否可取消
  final bool cancellable;

  YJDialogWindow({
    this.child,
    this.cancellable = false,
  });

  /// 调用弹窗
  static Future<bool> show(
    context, {
    /// 弹窗是否可取消
    bool cancellable = false,

    /// 自定义组件内容
    Widget? child,
  }) async {
    // 实例化当前对象
    YJDialogWindow yjDialogWindow = YJDialogWindow(
      child: child,
      cancellable: cancellable,
    );

    bool res = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => yjDialogWindow.dialog(context),
    );

    return res;
  }

  /// 弹窗内容
  Widget dialog(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          content: child,
        ),

        // 添加一个拖动区域，用于拖动窗口
        Positioned(
          top: 0,
          left: 0,
          child: DragToMoveArea(child: SizedBox(width: size.width, height: 50)),
        )
      ],
    );
  }
}
