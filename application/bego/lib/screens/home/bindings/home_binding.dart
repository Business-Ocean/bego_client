import 'package:bego/screens/home/controller/home_controller.dart';
import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego_core/bego_get.dart';

class HomeBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
        Bind.put(
          HomeController(HomeState.initial()),
        ),
      ];
}
