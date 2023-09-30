import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_network/bego_network.dart';
import 'package:flutter/material.dart';

class HomeController extends BePageController<HomeState> {
  HomeController(super.state);

  final client = Get.find<BeNetwork>();

  late List<dynamic> todos;

  final innerData = const BeData<String>.error().obs;

  Future<void> getLoginURL() async {
    innerData.value = const BeData.empty();
    await Future.delayed(const Duration(seconds: 4), () {});
    innerData.value = const BeData.loading();
    final response =
        await client.getHttp('https://jsonplaceholder.typicode.com/todos');
    await Future.delayed(const Duration(seconds: 4), () {});

    // final data = jsonDecode(jsonEncode(response.data));
    todos = response.data as List<dynamic>;
    innerData.value = const BeData.success(data: 'Data Loaded');
    debugPrint(todos.toString());
    // throw Exception('Error ho gaya bhai');
  }

  Future<void> executeSyncTask() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    innerData.value = const BeData.empty();
    await Future.delayed(const Duration(seconds: 2), () {});
    innerData.value = const BeData.loading();
    await Future.delayed(const Duration(seconds: 2), () {});
    innerData.value = const BeData.error();
    await Future.delayed(const Duration(seconds: 2), () {});
    innerData.value = const BeData.success(data: 'Data Loaded');
  }
}
