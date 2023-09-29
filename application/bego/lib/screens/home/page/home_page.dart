import 'package:bego/screens/home/controller/home_controller.dart';
import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

class HomePage extends ViewPage<HomeState, HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have Incremented counter value to :',
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Hello')),
              Obx(
                () => Text(
                  '${controller.count.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Container(
                height: 200,
                width: 200,
                color: BeTheme.of(context).becolors.lightInverse,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            // Get.changeTheme(BeTheme.createTheme(const BeThemeData.dark()));
            Get.find<BegoAppController>().toggleTheme();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
