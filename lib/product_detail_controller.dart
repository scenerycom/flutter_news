import 'dart:developer';

import 'package:get/get.dart';

import 'app_routes.dart';

class ProductDetailController extends GetxController {
// final MyRepository repository;
// ProductDetailController(this.repository);
  String productId = "";
  late final count = 0.obs;
  set obj(value) => this.count.value = value;
  get obj => this.count.value;

  @override
  void onReady() {
    update();
    print("onReady-------------------------");
    super.onReady();
  }

  /// 跳转商品详情
  handleProductDetailPageLogic(String productId) {
    // preventDuplicates// 是否防止跳转相同页面
    // Get.toNamed(AppRoutes.productDetailPage,
    //     preventDuplicates: false,
    //     arguments: {
    //       "productId": DateTime.now().microsecondsSinceEpoch.toString()
    //     });

    Get.toNamed(AppRoutes.setPage, arguments: {
      "productId": DateTime.now().microsecondsSinceEpoch.toString()
    });
  }
}
