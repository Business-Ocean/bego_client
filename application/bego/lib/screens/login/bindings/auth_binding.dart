import 'package:bego/screens/login/controller/sign_in_sign_up_controller.dart';
import 'package:bego/screens/login/state/sign_in_sing_up_state.dart';
import 'package:bego_core/bego_get.dart';

class AuthBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
        Bind.lazyPut(() => SignInSignUpController(SignInSignUpState.initial())),
      ];
}
