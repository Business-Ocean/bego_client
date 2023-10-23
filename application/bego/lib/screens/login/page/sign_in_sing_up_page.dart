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
        body: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: py32,
              constraints: const BoxConstraints(
                maxWidth: 500,
                maxHeight: 200,
                minWidth: 500,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppAssets.svg.begoIcon.svg(height: 180),
                  const Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: AppTitle(),
                    ),
                  ),
                ],
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
                    BeLabel(
                      label: const BeTinyLoader(
                        show: true,
                        color: Colors.white,
                      ),
                      position: BeLabelPosition.centerRight,
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
                    const LoginInWithGoogle(
                      loading: true,
                      // onPressed: controller.getLoginURL,
                    ),
                    space24,
                    Center(
                      child: TextButton(
                        onPressed: () {
                          BeNotificationsOverlay.of(context)?.show(
                            const BeNotification(
                              title: 'Hello',
                              description:
                                  'Sint tempor laborum ex tempor voluptate tempor minim labore et aliqua dolor ut occaecat nulla.',
                            ),
                          );
                          // DialogWrapper.of(context)?.show(
                          //   title: const Text('Hello'),
                          //   content: Container(
                          //     width: 100,
                          //     height: 100,
                          //     color: Colors.blue,
                          //   ),
                          // );
                        },
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
            const Padding(
              padding: EdgeInsets.only(bottom: 24, top: 16),
              child: LoginFooter(),
            ),
          ],
        ),
      );
}
