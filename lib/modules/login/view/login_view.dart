import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajie_app/modules/login/controllers/login_controller.dart';
import 'package:yajie_app/utils/yj_appbar.dart';

/// 首页视图
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: YjAppbar(),
      // 内容部分
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromRGBO(54, 143, 177,1),
            ],
          ),
        ),
        padding: const EdgeInsets.all(33.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 180,
                  child: Image.asset('assets/images/app_icon.png'),
                )
              ),
              TextFormField(
                controller: controller.unameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: Icon(Icons.person),
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null :"用户名不能为空";
                }
              ),
              Obx(()=>TextFormField(
                controller: controller.pwdController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  // 显示密码图标
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(controller.pwdShow.value ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      controller.pwdShow.value = !controller.pwdShow.value;
                    },
                  )
                ),
                obscureText: controller.pwdShow.value,
                //校验密码（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null :"密码不能为空";
                },
              )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 45.0),
                  child: ElevatedButton(
                    onPressed: controller.login,
                    child: const Text("登录"),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}
