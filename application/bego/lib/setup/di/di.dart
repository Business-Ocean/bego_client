// import 'package:bego/constants/app_constants.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_network/bego_network.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupLocator() async {
  await Hive.initFlutter();

  // Hive
  // ..reactive;

  // final box = await Hive.openBox<dynamic>(hiveStorage, crashRecovery: true);
  Get.put(BeEventBus(), permanent: true);
  Get.put(const BeNetwork(), permanent: true);
}
