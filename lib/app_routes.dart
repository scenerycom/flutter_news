import 'package:flutter_news/home_page.dart';
import 'package:flutter_news/login_page.dart';
import 'package:flutter_news/register_page.dart';
import 'package:flutter_news/unknown_page.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static const initialPage = "/";
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const unknownPage = "/unknownPage";
}

class AppPages {
  static final unknownPage =
      GetPage(name: AppRoutes.unknownPage, page: () => UnknownPage());

  static final pages = [
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        transition: Transition.rightToLeft),
    GetPage(name: "${AppRoutes.register}/:user", page: () => RegisterPage()),
  ];
}
