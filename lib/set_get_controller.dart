import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class SetGetController extends GetxController {
  final content = 0.obs;
  int aa = 1;

  final List data = [
    {"type_id": "1", "title": "账号安全"},
    {"type_id": "2", "title": "账号安全"},
    {"type_id": "3", "title": "账号安全"},
    {"type_id": "4", "title": "账号安全"},
    {"type_id": "5", "title": "退出登录"},
  ];

  set obj(value) => this.content.value = value;
  get obj => this.content.value;

  void handelA() {
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initServerData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    print("李大钊--设置页面onReady");
    super.onReady();
  }

  /// 跳转页面逻辑
  handleJumpPageLogic(String title) {
    if (title == "退出登录") {
      Get.offAllNamed(AppRoutes.loginPage);

      /// offNamed 关闭上一个页面
      /// A->B->C
      /// offNamed
      /// A->C
      /// offAllNamed 删除之前所有页面
    } else {}
  }

  /// 服务器数据
  void initServerData() {}
}
