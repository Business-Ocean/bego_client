import 'package:bego/components/login/app_title.dart';
import 'package:bego/components/login/login_footer.dart';
import 'package:bego/components/login/login_with_google.dart';
import 'package:bego/generated/assets.gen.dart';
import 'package:bego/screens/login/controller/sign_in_sign_up_controller.dart';
import 'package:bego/screens/login/state/sign_in_sing_up_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_component/bego_component.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class SignInSignUpPage
    extends ViewPage<SignInSignUpState, SignInSignUpController> {
  SignInSignUpPage({super.key});

  @override
  Widget buildPage(BuildContext context, SignInSignUpState? pageData) =>
      Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: infinityWidth,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage(AppAssets.image.stackedWaves.path),
                //   ),
                // ),
                child: Column(
                  children: [
                    space72,
                    AppAssets.svg.begoIcon.svg(height: 120),
                    Container(padding: px32, child: const AppTitle()),
                    space32,
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
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
                    BeLabel(
                      label: const BeTinyLoader(
                        show: true,
                        color: Colors.white,
                      ),
                      position: BeLabelPosition.centerRight,
                      offset: const Offset(-36, 0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                    const BeText(
                      'OR',
                      padding: EdgeInsets.symmetric(vertical: 16),
                      align: TextAlign.center,
                    ),
                    const LoginInWithGoogle(
                      loading: true,
                      // onPressed: controller.getLoginURL,
                    ),
                    space24,
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        // onPressed: controller.navigateHome,
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
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 24, top: 16),
              child: const LoginFooter(),
            ),
          ],
        ),
      );
}
