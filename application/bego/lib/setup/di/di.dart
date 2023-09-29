// import 'package:bego/constants/app_constants.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_network/bego_network.dart';

Future<void> setupConfig() async {
  // Hive
  // ..reactive;

  // final box = await Hive.openBox<dynamic>(hiveStorage, crashRecovery: true);
  Get
    ..put(BeEventBus(), permanent: true)
    ..put(const BeNetwork(), permanent: true);
}
