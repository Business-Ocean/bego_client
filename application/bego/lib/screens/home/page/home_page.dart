import 'package:bego/components/login/login_with_google.dart';
import 'package:bego/screens/home/controller/home_controller.dart';
import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_component/bego_component.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends ViewPage<HomeState, HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Row(
          children: [
            Expanded(
              child: Obx(
                () => BeReactiveWidget(
                  data: controller.innerData.value,
                  retryCallback: () async => controller.getLoginURL(),
                  builder: (BeData<String> data) => Column(
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
                      const Center(
                        child: TextButton(
                          onPressed: null,
                          child: Text(
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
            ),
            TextButton(
              onPressed: () async {
                await controller.executeSyncTask();
              },
              child: const Text('Get State '),
            ),
          ],
        ),
        //
        //     Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     Expanded(
        //       child: BeAsyncStateWidget(
        //         onInit: controller.getLoginURL,
        //         childSuccess: (data) => ListView.builder(
        //           itemCount: controller.todos.length,
        //           itemBuilder: itemBuilder,
        //         ),
        //       ),
        //     ),
        //     TextButton(
        //       onPressed: () {
        //         controller.getLoginURL();
        //       },
        //       child: const Text('Get Data'),
        //     ),
        //   ],
        // ),
      );

  Widget? itemBuilder(BuildContext context, int index) => ListTile(
        title: Text(controller.todos[index]['title'].toString()),
      );
}
