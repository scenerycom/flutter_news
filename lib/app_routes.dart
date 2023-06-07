import 'package:flutter_news/home_page.dart';
import 'package:flutter_news/live_list_page.dart';
import 'package:flutter_news/live_page.dart';
import 'package:flutter_news/login_page.dart';
import 'package:flutter_news/product_detail_page.dart';
import 'package:flutter_news/register_page.dart';
import 'package:flutter_news/set_page.dart';
import 'package:flutter_news/unknown_page.dart';
import 'package:flutter_news/video_detail_player_page.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static const initialPage = "/";
  static const homePage = '/homePage';
  static const loginPage = '/loginPage';
  static const registerPage = '/registerPage';
  static const unknownPage = "/unknownPage";
  static const productDetailPage = "/productDetailPage";
  static const setPage = "/setPage";
  static const videoDetailPlayerPage = "/videoDetailPlayerPage";
  static const liveListPage = "/liveListPage";
  static const livePage = "/livePage";
}

class AppPages {
  static final unknownPage =
      GetPage(name: AppRoutes.unknownPage, page: () => UnknownPage());

  static final pages = [
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
    GetPage(
        name: AppRoutes.loginPage,
        page: () => LoginPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: "${AppRoutes.registerPage}/:user", page: () => RegisterPage()),
    GetPage(name: AppRoutes.productDetailPage, page: () => ProductDetailPage()),
    GetPage(name: AppRoutes.setPage, page: () => SetPage()),
    GetPage(
        name: AppRoutes.videoDetailPlayerPage,
        page: () => VideoDetailPlayerPage()),
    GetPage(name: AppRoutes.liveListPage, page: () => LiveListPage()),
    GetPage(name: AppRoutes.livePage, page: () => LivePage()),
  ];
}
