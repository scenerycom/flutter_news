import 'package:flutter_news/app_routes.dart';
import 'package:get/get.dart';

class LoginGetController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  handleAddLogic() {
    count.value++;
  }

  handleJumpRegisterPageLogic() {
    Get.toNamed(AppRoutes.login);
  }
}
