import 'package:get/get.dart';

import 'translations_locale_Key.dart';

abstract class CustomLocales {
  static const zh_CN = {
    TranslationsLocaleKey.buttons_login: '登录',
    TranslationsLocaleKey.buttons_register: '注册',
    'buttons_sign_in': 'Cadastrar-se',
    'buttons_logout': 'Sair',
    'buttons_sign_in_fb': '用 Facebook 登录',
    'buttons_sign_in_google': '用 Google 登录',
    'buttons_sign_in_apple': '用 Apple 登录',
  };
  static const en_US = {
    TranslationsLocaleKey.buttons_login: 'Login',
    TranslationsLocaleKey.buttons_register: 'Register',
    'buttons_sign_in': 'Sign-in',
    'buttons_logout': 'Logout',
    'buttons_sign_in_fb': 'Sign-in with Facebook',
    'buttons_sign_in_google': 'Sign-in with Google',
    'buttons_sign_in_apple': 'Sign-in with Apple',
  };
}

class MessagesTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'zh_CN': CustomLocales.zh_CN,
        'en_US': CustomLocales.en_US,
      };
}
