import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';

class HomeController extends BePageController<HomeState> {
  HomeController(super.state);
  final count = 0.obs;
  int increment() => count.value++;
}
