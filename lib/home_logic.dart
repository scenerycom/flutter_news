// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/app_routes.dart';
import 'package:flutter_news/login_page.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  /// obs 是一个get语法， 返回RX类型实例，相当于包装了一层
  ///  get语法： RxInt get obs => RxInt(this);
  var count = 0.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // GetxService
    // TODO: implement onInit

    /// 搜索框   延迟1s进行，
    /// 网络请求 1s内多次点击
    // debounce(count, (callback) {
    //   print("debounce回调结果${callback}");
    // }, time: const Duration(seconds: 1));

    /// 每次都执行
    // ever(count, (callback) {
    //   print("ever回调结果${callback}");
    // });

    /// 开始只执行一次，后续不再执行
    // once(count, (callback) {
    //   print("once${callback}");
    // });
//  List<RxInterface> listeners,
    // everAll(listeners, (callback) => null)

    /// condition: true 回调callback  false 不回调回调callback
    // interval(count, (callback) {
    //   print("interval${callback}");
    // }, time: const Duration(seconds: 2), condition: true);

    // var db = FirebaseFirestore.instance;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  handleSearch() {
    debounce<int>(count, (callback) {
      print("回调结果${callback}");
    }, time: const Duration(seconds: 1));
  }

  handleAA() async {
    print("AAA执行");
    await handleBB();
    print("2222执行");
    handleCC();
  }

  handleBB() async {
    print("BBB2333---------------执行");
    await Future.delayed(Duration(seconds: 20), () {
      print("666666-----");
      return "123344";
    });

    print("BBB执行");
    // await handleCC();
  }

  handleCC() {
    print("handleCC执行");
  }

  handleLivePageLogic() {
    Get.toNamed(AppRoutes.livePage, arguments: {"productId": "123"});
  }

  add() async {
    count++;
    // Get.toNamed(AppRoutes.productDetailPage, arguments: {"productId": "123"});
    Get.toNamed(AppRoutes.liveListPage, arguments: {"productId": "123"});
    // handleAA();
    // Get.config()
    // Get.until();
    // 转到下一个命名的路由，并删除所有之前的路由，直到表达式返回true。
// Get.offNamedUntil()
    // 转到下一条路由，并删除所有之前的路由，直到表达式返回true。
    // Get.offUntil(page, (route) => false)
    // Get.bottomSheet(Container(
    //   child: Wrap(
    //     children: <Widget>[
    //       ListTile(
    //           leading: Icon(Icons.music_note),
    //           title: Text('Music'),
    //           onTap: () {}),
    //       ListTile(
    //         leading: Icon(Icons.videocam),
    //         title: Text('Video'),
    //         onTap: () {},
    //       ),
    //     ],
    //   ),
    // ));

// Get.generalDialog(pageBuilder: pageBuilder)
    /// 自己定制
    // Get.dialog(Text("哈哈哈--"));
    // 你也可以用Get.generalDialog代替showGeneralDialog。
    // Get.defaultDialog(
    //     onConfirm: () => print("Ok"), middleText: "Dialog made in 3 lines");
    // Get.rawSnackbar(title: "hello", message: "哈哈哈");
    // Get.snackbar("helloworld", "Flutter is better");  // 可以根据参数定制

    // 路由跳转
    // var data = await Get.to(LoginPage());
    // print("上一个页面返回：$data");

    // Get.back(result: 'success');  返回上一个页面调用  data会接受到值
    // Get.offNamedUntil(page, (route) => false) // 跳转到指定页面
// Get.offUntil(page, (route) => false) // 跳转到指定页面
    // Get.toNamed(AppRoutes.login);  //通过路由的方式
    // Get.offNamed(AppRoutes.login); // 删除前一个页面
    // Get.offAllNamed(AppRoutes.login); // 删除所有以前的页面
    // Get.to(LoginPage());  // 实例化界面形式
    // Get.off(LoginPage()); // 进入下一个页面，但没有返回上一个页面的选项（用于SplashScreens，登录页面等）。
    // Get.back();
    // Get.offAll(LoginPage()); // 进入下一个界面并取消之前的所有路由（在购物车、投票和测试中很有用）。
    //  Get.toNamed(AppRoutes.login,arguments:"123");  //传递参数
    //  Get.arguments // 获取参数
// Get.toNamed(
//         "${AppRoutes.register}/389");
    // Get.toNamed(
    //     "${AppRoutes.register}/389?pwd=true"); // flutter: {pwd: true, user: 389}
    // Get.parameters["phone"] //在需要的页面
  }
}


/*

///每次`count1`变化时调用。
ever(count1, (_) => print("$_ has been changed"));

///只有在变量$_第一次被改变时才会被调用。
once(count1, (_) => print("$_ was changed once"));

///防DDos - 每当用户停止输入1秒时调用，例如。
debounce(count1, (_) => print("debouce$_"), time: Duration(seconds: 1));

///忽略1秒内的所有变化。
interval(count1, (_) => print("interval $_"), time: Duration(seconds: 1));

*/