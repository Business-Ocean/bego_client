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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BeAsyncStateWidget(
                onInit: controller.getLoginURL,
                childSuccess: (data) => ListView.builder(
                  itemCount: controller.todos.length,
                  itemBuilder: itemBuilder,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.getLoginURL();
              },
              child: const Text('Get Data'),
            ),
          ],
        ),
      );

  Widget? itemBuilder(BuildContext context, int index) => ListTile(
        title: Text(controller.todos[index]['title'].toString()),
      );
}
