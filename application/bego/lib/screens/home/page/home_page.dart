// ignore_for_file: avoid_dynamic_calls

import 'package:bego/screens/home/controller/home_controller.dart';
import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:flutter/material.dart';

class HomePage extends ViewPage<HomeState, HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: const Row(
          children: [
            // Expanded(
            //   child: Obx(
            //     () => BeReactiveWidget(
            //       data: controller.innerData.value,
            //       offset: const Offset(-100, 0),
            //       retryCallback: () async => controller.getLoginURL(),
            //       builder: (BeData<String> data) => Column(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: [
            //           space32,
            //           const BeTextField(
            //             hint: 'Enter Email',
            //             label: 'Email',
            //           ),
            //           space32,
            //           const BeTextField(
            //             hint: 'Enter Password',
            //             label: 'Password',
            //           ),
            //           space32,
            //           // const Spacer(),
            //           ElevatedButton(
            //             onPressed: () async => controller.getLoginURL(),
            //             style: ElevatedButton.styleFrom(
            //               padding: const EdgeInsets.all(24),
            //             ),
            //             child: const Text(
            //               'Login',
            //               style: TextStyle(fontSize: 16),
            //             ),
            //           ),
            //           const BeText(
            //             'OR',
            //             padding: EdgeInsets.symmetric(vertical: 16),
            //             align: TextAlign.center,
            //           ),

            //           space24,
            //           const Center(
            //             child: TextButton(
            //               onPressed: null,
            //               child: Text(
            //                 'Skip',
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // TextButton(
            //   onPressed: () async {
            //     await controller.executeSyncTask();
            //   },
            //   child: const Text('Get State '),
            // ),
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
