import 'package:flutter/material.dart';
import 'package:flutter_news/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ProductDetailController productGetController;
  String productId = "";
  @override
  void initState() {
    // TODO: implement initState

    productId = Get.arguments['productId'] as String;
    print("商品详情ID：${Get.arguments['productId']}++++${productId}");
    productGetController = Get.put(ProductDetailController(), tag: productId);

    /// 使用tag 还需要关闭跳转的防止相同页面跳转属性
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(productId);
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("商品详情"),
            ),
            body: GetBuilder<ProductDetailController>(
                tag: productId,
                builder: (_) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => ElevatedButton(
                              onPressed: () {
                                // loginGetController.handleAddLogic();

                                /// 上一个页面会接受到值
                              },
                              child: Text("${productGetController.count}")),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // Get.back(result: '登录页面返回--success');
                              productGetController.obj++;

                              /// 上一个页面会接受到值
                            },
                            child: Text("返回")),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              productGetController
                                  .handleProductDetailPageLogic("123");
                            },
                            child: Text("进入下一页面")),
                      ],
                    ),
                  );
                })));
  }
}
