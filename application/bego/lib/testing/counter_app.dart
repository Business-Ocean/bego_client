import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final MyHomePageController controller = Get.put(MyHomePageController());
  MyHomePage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have Incremented counter value to :',
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Hello")),
            Obx(
              () => Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Get.changeTheme(BeTheme.createTheme(const BeThemeData.light()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyHomePageController extends GetxController {
  final count = 0.obs;
  increment() => count.value++;
}
