import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego_app/bego_app.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_network/bego_network.dart';

class HomeController extends BePageController<HomeState> {
  HomeController(super.state);

  final client = Get.find<BeNetwork>();

  late List<dynamic> todos;

  Future<void> getLoginURL() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    final response =
        await client.getHttp('https://jsonplaceholder.typicode.com/todos');

    // final data = jsonDecode(jsonEncode(response.data));
    todos = response.data as List<dynamic>;

    print(todos);
    // throw Exception('Error ho gaya bhai');
  }
}
