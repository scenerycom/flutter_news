import 'package:flutter/cupertino.dart';
import 'package:flutter_news/app_routes.dart';
import 'package:flutter_news/messages_translations.dart';

import 'package:get/get.dart';

class GetAppManager {
  static Widget get rootApp {
    return GetMaterialApp(
      initialRoute: AppRoutes.homePage,
      unknownRoute: AppPages.unknownPage,
      translations: MessagesTranslations(),
      locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
      fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
      getPages: AppPages.pages,
      routingCallback: (routing) {
        /*
         String current;
  String previous;
  dynamic args;
  String removed;
  Route<dynamic>? route;
  bool? isBack;
  // bool? isSnackbar;
  bool? isBottomSheet;
  bool? isDialog;
        */
        /// 监听页面事件
        print("GetAppManager---routingCallback:${routing?.current}");

        /// 是否需要打开广告页面
        if (routing?.current == AppRoutes.homePage) {
          print("打开广告页面");
        }
      },
    );
  }

  /// 如果没有使用 GetMaterialApp  使用的是系统的 MaterialApp ，手动开启监听
  void handleObServer() {
    // GetObserver(MiddleWare.observer as Function(Routing? p1)?);
    //   MaterialApp(
    //     onGenerateRoute: Router.generateRoute,
    //     initialRoute: "/",
    //     navigatorKey: Get.key,
    //     navigatorObservers: [
    //       GetObserver(MiddleWare.observer), // HERE !!!
    //     ],
    //   ),
    // );
  }
}

class MiddleWare {
  static observer(Routing routing) {
    ///你除了可以监听路由外，还可以监听每个页面上的SnackBars、Dialogs和Bottomsheets。
    // if (routing.current == '/second' && !routing.isSnackbar) {
    //   Get.snackbar("Hi", "You are on second route");
    // } else if (routing.current == '/third') {
    //   print('last route called');
    // }
  }
}
