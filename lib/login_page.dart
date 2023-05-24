import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/translations_locale_Key.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String tag = "";

  final LoginGetController loginGetController = Get.put(LoginGetController(),
      tag: "${DateTime.now().millisecondsSinceEpoch}");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar:
          AppBar(title: Text(TranslationsLocaleKey.buttons_login.tr), actions: [
        InkWell(
            onTap: () {
              loginGetController.handleExchangeLanguageLogic();
            },
            child: Center(child: Text("切换中文"))),
        SizedBox(
          width: 50,
        ),
        InkWell(
            onTap: () {
              loginGetController.handleExchangeLanguageLogic();
            },
            child: Center(child: Text("切换英文"))),
      ]),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => ElevatedButton(
                onPressed: () {
                  loginGetController.handleAddLogic();

                  /// 上一个页面会接受到值
                },
                child: Text("${loginGetController.count}")),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.back(result: '登录页面返回--success');

                /// 上一个页面会接受到值
              },
              child: Text("返回")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                loginGetController.handleJumpRegisterPageLogic();
              },
              child: Text("进入下一页面")),
        ],
      )),
    ));
  }
}
