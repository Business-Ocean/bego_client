import 'package:bego/screens/home/bindings/home_binding.dart';
import 'package:bego/screens/home/page/home_page.dart';
import 'package:bego/screens/login/bindings/auth_binding.dart';
import 'package:bego/screens/login/page/sign_in_sing_up_page.dart';
import 'package:bego_core/bego_get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = AppRoutes.signInSignUp;
  static final routes = [
    GetPage<void>(
      name: _Paths.signInSignUp,
      page: SignInSignUpPage.new,
      binding: AuthBinding(),
    ),
    GetPage<void>(
      name: _Paths.home,
      page: HomePage.new,
      binding: HomeBinding(),
    ),
  ];
}

class PageArgument {}
