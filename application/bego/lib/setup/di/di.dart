// import 'package:bego/constants/app_constants.dart';

import 'package:bego/screens/login/controller/sign_in_sign_up_controller.dart';
import 'package:bego/screens/login/state/sign_in_sing_up_state.dart';
import 'package:bego_app/bego_di.dart';

Future<void> setupConfig() async {
  // Hive
  // ..reactive;

  // final box = await Hive.openBox<dynamic>(hiveStorage, crashRecovery: true);
  // Get
  //   ..put(BeEventBus(), permanent: true)
  //   ..put(const BeNetwork(), permanent: true);

  BegoDi.registerLazySingleton(
    () => SignInSignUpController(SignInSignUpState.initial()),
  );
}
