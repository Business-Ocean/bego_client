import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class PopExample extends StatefulWidget {
  const PopExample({super.key});

  @override
  State<PopExample> createState() => _PopExampleState();
}

class _PopExampleState extends State<PopExample> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<SampleItem>(
        initialValue: selectedMenu,
        // Callback that sets the selected popup menu item.
        onSelected: (SampleItem item) {
          setState(() {
            selectedMenu = item;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemOne,
            child: Text('Item 1'),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: Text('Item 2'),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: Text('Item 3'),
          ),
        ],
        child: const Icon(Icons.opacity),
      ),
    );
  }
}
