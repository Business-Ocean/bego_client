import 'package:bego/sample/tab_bar_example.dart';
import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BeTheme(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: BeTheme.createTheme(const BeThemeData.light()),
        home: MyHomePage(key: UniqueKey(), title: 'Flutter Demo Home '),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GlobalKey popupKey = GlobalKey();

  bool value = false;
  double sliderValue = 0;
  List<bool> selectionList = [false, false, true];
  final Set<String> items = {'a', 'b', 'c', 'd'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: ColumnSuper(
            innerDistance: 10,
            children: [
              Container(),
              // const Checkbox(value: true, onChanged: null),
              // const Checkbox(value: false, onChanged: null),
              // Checkbox(value: true, onChanged: (v) {}),
              // Checkbox(value: false, onChanged: (v) {}),
              // Switch(
              //     value: value,
              //     onChanged: (v) {
              //       setState(() {
              //         value = v;
              //       });
              //     }),
              // Switch(value: true, onChanged: (v) {}),
              // const Switch(value: false, onChanged: null),
              // const Switch(value: true, onChanged: null),
              // Radio(value: false, groupValue: 'groupValue', onChanged: (v) {}),
              // Radio(value: true, groupValue: true, onChanged: (v) {}),
              // const Radio(
              //     value: false, groupValue: 'groupValue', onChanged: null),
              // const Radio(value: true, groupValue: true, onChanged: null),
              // const CircularProgressIndicator(),
              // const LinearProgressIndicator(),
              // Slider(
              //     label: 'Hello',
              //     value: sliderValue,
              //     onChanged: (v) {
              //       setState(() {
              //         sliderValue = v;
              //       });
              //     }),
              // Slider(value: sliderValue, onChanged: null),
              // const Card(
              //     child: Padding(
              //   padding: EdgeInsets.all(80.0),
              //   child: BeText(
              //     "data",
              //     padding: Pad(all: 10),
              //   ),
              // )),
              // Button(
              //     builder: ({required bool isPressed}) {
              //       return ElevatedButton(
              //           onPressed: () {}, child: const Text("Button"));
              //     },
              //     onTap: () {}),
              // const BeTextExpand(
              //   maxLines: 2,
              //   text:
              //       'A text panel wiem expand and collapse functions, with more or collapse buttons in the lower right corner of the text',
              // ),
              // const BePageLoading(),
              // const Text("short copy Loading Exhibit"),
              // const BePageLoading(
              //   content: "I am shorter Loading",
              // ),
              // const Text("Long copy Loading Exhibit"),
              // const BePageLoading(
              //   content: "I am longerI am longerI am longer loading",
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     BeLoadingDialog.show(
              //       context,
              //       barrierDismissible: true,
              //     ).then((value) {
              //       // BeToast.show('result: $value', context);
              //     });
              //   },
              //   child: const Text('Popup BeLoadingDialog'),
              // ),
              // ElevatedButton(
              //   key: popupKey,
              //   onPressed: () {
              //     BePopupWindow.showPopWindow(
              //       context,
              //       'Hello',
              //       popupKey,
              //     );
              //   },
              //   child: const Text('Show popup'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     BeToast.show(
              //       context,
              //       "Hello",
              //     );
              //   },
              //   child: const Text('Show toast'),
              // ),
              // BeNumberFormField(
              //   initialValue: 20,
              // ),

              // Tooltip(
              //   verticalOffset: 10,
              //   richMessage: TextSpan(
              //     text: 'I am a rich tooltip. ',
              //     children: <InlineSpan>[
              //       TextSpan(
              //         text: 'I am another span of this rich tooltip',
              //       ),
              //     ],
              //   ),
              //   child: Text('Tap this text and hold down to show a tooltip.'),
              // )
              // ToggleButtons(
              //   isSelected: selectionList,
              //   onPressed: (index) {
              //     setState(() {
              //       selectionList[index] = !selectionList[index];
              //     });
              //   },
              //   children: const [
              //     Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text('Item 1 Item 1Item 1Item 1Item 1Item 1'),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text('Item 2'),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text('Item 3'),
              //     )
              //   ],
              // ),
              // ElevatedButton(
              //     onPressed: () async {
              //       Future<TimeOfDay?> selectedTime = showTimePicker(
              //         initialTime: TimeOfDay.now(),
              //         context: context,
              //       );
              //     },
              //     child: const Text('Show Calendar'))
              // const SelectableText(
              // 'Qui velit aliquip velit magna enim aliquip culpa nisi. ')

              // TextButton(onPressed: () {}, child: const Text('Button')),
              // const TextButton(onPressed: null, child: Text('Disabled')),
              // TextButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(Icons.ac_unit_rounded),
              //   label: const Text('Button'),
              // ),
              // TextButton.icon(
              //     onPressed: null,
              //     icon: const Icon(Icons.ac_unit_rounded),
              //     label: const Text('Button'))
              // const SizedBox(height: 500, child: TabBarExample())
              // ElevatedButton(
              //   onPressed: () {
              //     ScaffoldMessenger.of(context).showMaterialBanner(
              //         MaterialBanner(content: const Text('Hello'), actions: [
              //       Builder(builder: (context) {
              //         return ElevatedButton(
              //             onPressed: () {}, child: const Text('Action'));
              //       })
              //     ]));
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //       content: const Text('Hello'),
              //       action: SnackBarAction(label: 'OK', onPressed: () {}),
              //       // dismissDirection: DismissDirection.up,
              //     ));

              //     // ScaffoldMessenger.of(context).clearMaterialBanners();
              //   },
              //   child: const Text('Snack bar'),
              // ),
              const Text('Single choice'),
              const SingleChoice(),
              const SizedBox(height: 20),
              const Text('Multiple choice'),
              const MultipleChoice(),
            ],
          ),
        ),
      ),
    );
  }
}

// children: [
//                 Checkbox(value: true, onChanged: (v) {}),
//                 Checkbox(value: false, onChanged: (v) {}),
//                 Switch(value: false, onChanged: (v) {}),
//                 Switch(value: true, onChanged: (v) {}),
//                 Radio(
//                     value: false, groupValue: 'groupValue', onChanged: (v) {}),
//                 Radio(value: true, groupValue: true, onChanged: (v) {}),
//                 const CircularProgressIndicator(),
//                 const LinearProgressIndicator(),
//                 const Card(
//                     child: BeText(
//                   "data",
//                   padding: Pad(all: 10),
//                 )),
//                 Button(
//                     builder: ({required bool isPressed}) {
//                       return ElevatedButton(
//                           onPressed: () {}, child: const Text("Button"));
//                     },
//                     onTap: () {}),
//               ],
