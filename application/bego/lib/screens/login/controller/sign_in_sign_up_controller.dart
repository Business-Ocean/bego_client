import 'package:bego/routes/app_pages.dart';
import 'package:bego/screens/login/state/sign_in_sing_up_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';

class SignInSignUpController extends BePageController<SignInSignUpState> {
  SignInSignUpController(super.state);
  // final client = Get.find<BeNetwork>();

  Future<void> getLoginURL() async {
    // final response = await client.getHttp('http://192.168.29.227:8080/login');
    // print(response);
  }

  Future<void> navigateHome() async {
    await Get.offNamed<void>(AppRoutes.home);
  }
}
