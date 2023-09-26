import 'package:bego/screens/home/bindings/home_binding.dart';
import 'package:bego/screens/home/page/home_page.dart';
import 'package:bego/screens/login/bindings/auth_binding.dart';
import 'package:bego/screens/login/page/sign_in_sing_up_page.dart';
import 'package:bego_core/bego_get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.home;
  static final routes = [
    GetPage<PageArgument>(
      name: _Paths.signInSignUp,
      page: SignInSignUpPage.new,
      binding: AuthBinding(),

      // page: () => const LoginPage(),
      // binding: LoginBinding(),
    ),
    GetPage<PageArgument>(
      name: _Paths.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

class PageArgument {}
