import 'dart:ui';

import 'package:flutter_news/app_routes.dart';
import 'package:get/get.dart';

class LoginGetController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // var locale = Locale('US', 'en');
    // var locale = Locale('en', 'US');
  }

  handleAddLogic() {
    count.value++;
  }

  /// 切换语言
  handleExchangeLanguageLogic() {
    if (Get.locale?.countryCode == "CN") {
      var locale = Locale('en', 'US');
      Get.updateLocale(locale);
    } else {
      var locale = Locale('zh', 'CN');
      Get.updateLocale(locale);
    }
    // 全部页面生效
    // Get.offAllNamed("/");
  }

  handleJumpRegisterPageLogic() {
    // Get.toNamed(AppRoutes.loginPage);
  }
}
