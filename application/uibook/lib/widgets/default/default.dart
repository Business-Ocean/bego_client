import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Material Default Widget', type: Material)
Widget defaultWidgets(BuildContext context) {
  return const _DefaultThemeWidget(title: 'Material 3 Default ');
}

class _DefaultThemeWidget extends StatefulWidget {
  const _DefaultThemeWidget({required this.title});

  final String title;

  @override
  State<_DefaultThemeWidget> createState() => _DefaultThemeWidgetState();
}

class _DefaultThemeWidgetState extends State<_DefaultThemeWidget> {
  late GlobalKey popupKey = GlobalKey();

  bool value = false;
  double sliderValue = 0;
  List<bool> selectionList = [false, false, true];
  final Set<String> items = {'a', 'b', 'c', 'd'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ColumnSuper(
            innerDistance: 40,
            children: [
              Container(),
              const Checkbox(value: true, onChanged: null),
              const Checkbox(value: false, onChanged: null),
              Checkbox(value: true, onChanged: (v) {}),
              Checkbox(value: false, onChanged: (v) {}),
              Switch(
                  value: value,
                  onChanged: (v) {
                    setState(() {
                      value = v;
                    });
                  }),
              Switch(value: true, onChanged: (v) {}),
              const Switch(value: false, onChanged: null),
              const Switch(value: true, onChanged: null),
              Radio(value: false, groupValue: 'groupValue', onChanged: (v) {}),
              Radio(value: true, groupValue: true, onChanged: (v) {}),
              const Radio(
                  value: false, groupValue: 'groupValue', onChanged: null),
              const Radio(value: true, groupValue: true, onChanged: null),
              const CircularProgressIndicator(),
              const LinearProgressIndicator(),
              Slider(
                  label: 'Hello',
                  value: sliderValue,
                  onChanged: (v) {
                    setState(() {
                      sliderValue = v;
                    });
                  }),
              Slider(value: sliderValue, onChanged: null),
              const Card(
                  child: Padding(
                padding: EdgeInsets.all(80.0),
                child: BeText(
                  " Ea esse fugiat et voluptate aliqua ex fugiat Lorem do magna fugiat laborum. Eu veniam in nostrud magna. Labore ad sit non voluptate fugiat. Excepteur nostrud irure sit qui amet quis consectetur sint dolor officia fugiat. Eu deserunt pariatur fugiat magna esse ut cillum.",
                  padding: Pad(all: 10),
                ),
              )),
              Button(
                  builder: ({required bool isPressed}) {
                    return ElevatedButton(
                        onPressed: () {}, child: const Text("Button"));
                  },
                  onTap: () {}),

              const Text("short copy Loading Exhibit"),
              const Text("Long copy Loading Exhibit"),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Popup BeLoadingDialog'),
              ),
              ElevatedButton(
                key: popupKey,
                onPressed: () {},
                child: const Text('Show popup'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Show toast'),
              ),

              const Tooltip(
                verticalOffset: 10,
                richMessage: TextSpan(
                  text: 'I am a rich tooltip. ',
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'I am another span of this rich tooltip',
                    ),
                  ],
                ),
                child: Text('Tap this text and hold down to show a tooltip.'),
              ),
              ToggleButtons(
                isSelected: selectionList,
                onPressed: (index) {
                  setState(() {
                    selectionList[index] = !selectionList[index];
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Item 1 Item 1Item 1Item 1Item 1Item 1'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Item 2'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Item 3'),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                  },
                  child: const Text('Show Calendar')),
              const SelectableText(
                  'Qui velit aliquip velit magna enim aliquip culpa nisi. '),

              TextButton(onPressed: () {}, child: const Text('Button')),
              const TextButton(onPressed: null, child: Text('Disabled')),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_rounded),
                label: const Text('Button'),
              ),
              TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.ac_unit_rounded),
                  label: const Text('Button')),
              // const SizedBox(height: 500, child: TabBarExample()),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(content: const Text('Hello'), actions: [
                    Builder(builder: (context) {
                      return ElevatedButton(
                          onPressed: () {}, child: const Text('Action'));
                    })
                  ]));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Hello'),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                    // dismissDirection: DismissDirection.up,
                  ));

                  // ScaffoldMessenger.of(context).clearMaterialBanners();
                },
                child: const Text('Snack bar'),
              ),
              const Text('Single choice'),
              // const SingleChoice(),
              const SizedBox(height: 20),
              const Text('Multiple choice'),
              // const MultipleChoice(),
              // const SizedBox(height: 400, child: PinnedSearchBarApp()),
              ElevatedButton(
                onPressed: () async {
                  // var result = await showSearch<String>(
                  //   context: context,
                  //   delegate: CustomDelegate(),
                  // );
                  // setState(() => _result = result);
                },
                child: const Text('Search'),
              ),
              // const PopExample()
              OutlinedButton(onPressed: () {}, child: const Text("Button")),
              const OutlinedButton(
                  onPressed: null, child: Text("Disabled Button")),
              ElevatedButton(onPressed: () {}, child: const Text("Button")),
              const ElevatedButton(
                  onPressed: null, child: Text("Disabled Button")),
              const ListTile(
                title: Text('Title'),
                subtitle: Text(
                    'Veniam elit qui elit incididunt est sint ad adipisicing pariatur laboris.'),
                leading: Icon(Icons.lock_clock_outlined),
                trailing: Icon(Icons.donut_large),
                // isThreeLine: true,
              ),
              const ListTile(
                selected: true,

                title: Text('Title'),
                subtitle: Text(
                    'Nisi cillum occaecat excepteur qui nulla fugiat non cillum minim do consectetur ullamco aliqua. Nisi cillum occaecat excepteur qui nulla fugiat non cillum minim do consectetur ullamco aliqua.'),
                leading: Icon(Icons.lock_clock_outlined),
                trailing: Icon(Icons.donut_large),
                // isThreeLine: true,
              ),
              const ListTile(
                selected: false,
                title: Text('Title'),
                subtitle: Text(
                    'Nisi cillum occaecat excepteur qui nulla fugiat non cillum minim do consectetur ullamco aliqua. Nisi cillum occaecat excepteur qui nulla fugiat non cillum minim do consectetur ullamco aliqua.'),
                leading: Icon(Icons.lock_clock_outlined),
                trailing: Icon(Icons.donut_large),
                isThreeLine: true,
              ),
              const ListTile(
                selected: true,
                title: Text('Title'),
                subtitle: Text(
                    'Nisi cillum occaecat excepteur qui nulla fugiat non cillum minim do consectetur ullamco aliqua. Nisi cillum occaecat excepteur qui nulla fugiat non cillum minim do consectetur ullamco aliqua.'),
                leading: Icon(Icons.lock_clock_outlined),
                trailing: Icon(Icons.donut_large),
                isThreeLine: true,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.ads_click_rounded)),
              const IconButton(
                  onPressed: null, icon: Icon(Icons.ads_click_rounded)),
              IconButton.filled(
                  onPressed: () {}, icon: const Icon(Icons.ads_click_rounded)),
              const IconButton.filled(
                  onPressed: null, icon: Icon(Icons.ads_click_rounded)),
              IconButton.outlined(
                  onPressed: () {}, icon: const Icon(Icons.ads_click_rounded)),
              const IconButton.outlined(
                  onPressed: null, icon: Icon(Icons.ads_click_rounded)),
              IconButton.filledTonal(
                  onPressed: () {}, icon: const Icon(Icons.ads_click_rounded)),
              const IconButton.filledTonal(
                  onPressed: null, icon: Icon(Icons.ads_click_rounded)),

              FloatingActionButton.extended(
                onPressed: () {},
                icon: const Icon(Icons.done),
                label: const Text('Label'),
              ),

              FloatingActionButton.large(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FilledButton(onPressed: () {}, child: const Text('Button')),
              const FilledButton(onPressed: null, child: Text('Button')),
              FilledButton.icon(
                onPressed: () {},
                label: const Text('Icon Button'),
                icon: const Icon(Icons.punch_clock_rounded),
              ),
              FilledButton.icon(
                onPressed: null,
                label: const Text('Icon Button'),
                icon: const Icon(Icons.punch_clock_rounded),
              ),
              FilledButton.tonalIcon(
                onPressed: null,
                label: const Text('Icon Button'),
                icon: const Icon(Icons.done_all),
              ),
              FilledButton.tonalIcon(
                onPressed: () {},
                label: const Text('Icon Button'),
                icon: const Icon(Icons.done_all),
              ),

              FilledButton.tonal(onPressed: () {}, child: const Text('Button')),
              const FilledButton.tonal(onPressed: null, child: Text('Button')),
              // Container(
              //     margin: const EdgeInsets.all(16),
              //     child: const ExpansionTileExample()),
              const Text("datadata"),
              const Divider(),
              const Text("datadata"),

              Chip(
                // clipBehavior: Clip.hardEdge,
                // padding: EdgeInsets.zero,
                // labelPadding: EdgeInsets.zero,
                // elevation: 10,
                // deleteIcon: const Icon(Icons.close),
                avatar: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.black.withAlpha(33),
                  child: const Text(
                    'AB',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
                label: const Text('Aaron Burr'),
              ),
              const Chip(
                avatar: Icon(Icons.done_all_outlined),
                label: Text('Aaron Burr'),
              ),
              const Card(
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Center(
                    child: Text("Card"),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.blue.withAlpha(20),
                    width: 200,
                    height: 100,
                    child: const Center(
                      child: Text("Card"),
                    ),
                  ),
                ),
              ),

              Container(
                color: Colors.blue.withAlpha(50),
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Hello'),
                      onPressed: () {
                        // Do something when the button is pressed.
                      },
                    ),
                    ElevatedButton(
                      child: const Text('World!'),
                      onPressed: () {
                        // Do something when the button is pressed.
                      },
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  // Show the bottom sheet.
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 400,
                      color: Colors.grey,
                      child: const Center(
                          child: BeText.titleLarge("Bottom sheet")),
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),

              const MaterialBanner(
                content: Text('This is a MaterialBanner message!'),
                actions: [
                  Text(
                    'Dismiss',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              Badge(
                label: Container(
                  alignment: Alignment.center,
                  // color: Colors.green,
                  width: 20,
                  height: 20,
                  child: const Text('Hi'),
                ),
                child: Container(
                  color: Colors.red,
                  child: const Icon(
                    BeIcons.icon_smile,
                    size: 100,
                  ),
                ),
              ),
              TextField(
                enableInteractiveSelection: false,
                controller: TextEditingController(
                    text:
                        'Ullamco magna in irure est fugiat tempor commodo adipisicing aute occaecat et.'),
              ),
              const TextField(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter the Value',
                  errorText: 'Value Can\'t Be Empty',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Enter the Value', isCollapsed: true),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Enter the Value', isCollapsed: false),
              ),

              TextField(
                controller: TextEditingController(text: 'Username'),
              ),
              TextField(
                  controller: TextEditingController(text: 'password'),
                  obscureText: true),
              TextField(
                controller: TextEditingController(
                    text: 'Magna elit sunt consequat mollit eiusmod.'),
              ),
              TextFormField(),

              // const Center(
              //     child: StaggeredDotsWave(
              //   color: BegoColors.blue,
              //   size: 50,
              // ),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(BeIcons.icon_at),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(BeIcons.icon_search_found),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(BeIcons.icon_settings_2),
            label: 'Settings',
          ),
        ],
        currentIndex: 0, // This is the default selected item.
        onTap: (index) {
          // Handle the item tap event.
        },
      ),

      // bottomNavigationBar: BottomAppBar(
      //     child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.home),
      //       onPressed: () {
      //         // Do something when the button is pressed.
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.search),
      //       onPressed: () {
      //         // Do something when the button is pressed.
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.settings),
      //       onPressed: () {
      //         // Do something when the button is pressed.
      //       },
      //     ),
      //   ],
      // )),
    );
  }

  // final String _result = '';
}
