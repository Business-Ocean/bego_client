import 'package:bego/components/login/app_title.dart';
import 'package:bego/components/login/login_footer.dart';
import 'package:bego/components/login/login_with_google.dart';
import 'package:bego/generated/assets.gen.dart';
import 'package:bego/screens/login/controller/sign_in_sign_up_controller.dart';
import 'package:bego/screens/login/state/sign_in_sing_up_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_component/bego_component.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class SignInSignUpPage
    extends ViewPage<SignInSignUpState, SignInSignUpController> {
  const SignInSignUpPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: DecoratedBox(
                // padding: const EdgeInsets.only(top: 32),
                // color: becolors(context).primary,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AppAssets.image.headerBg3.provider(),
                    fit: BoxFit.cover,
                    // colorFilter: const ColorFilter.mode(
                    //   BegoColors.roseRed,
                    //   BlendMode.colorBurn,
                    // ),
                    // invertColors: true,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppAssets.svg.begoIcon.svg(
                      width: context.width * 0.4,
                    ),
                    // const BusinessOceanLogo(),
                    const Expanded(
                      child: AppTitle(),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(endIndent: 0, indent: 0),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    space32,
                    const BeTextField(
                      hint: 'Enter Email',
                      label: 'Email',
                    ),
                    space32,
                    const BeTextField(
                      hint: 'Enter Password',
                      label: 'Password',
                    ),
                    space32,
                    // const Spacer(),
                    BeInputLabel(
                      label: const BeTinyLoader(
                        show: true,
                        color: Colors.white,
                      ),
                      position: BeInputLabelPosition.centerRight,
                      offset: const Offset(-40, 0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(24),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const BeText(
                      'OR',
                      padding: EdgeInsets.symmetric(vertical: 16),
                      align: TextAlign.center,
                    ),
                    LoginInWithGoogle(
                      loading: true,
                      onPressed: () => controller.getLoginURL(),
                    ),
                    space24,
                    Center(
                      child: TextButton(
                        onPressed: controller.navigateHome,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24, top: 16),
              child: LoginFooter(),
            ),
          ],
        ),
      );
}
