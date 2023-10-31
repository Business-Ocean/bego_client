import 'dart:async';

import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'After Layout State Helper', type: AfterLayout)
Widget afterLayoutMixin(BuildContext context) {
  return const AfterLayoutUseCase();
}

class AfterLayoutUseCase extends StatefulWidget {
  const AfterLayoutUseCase({super.key});

  @override
  State<AfterLayoutUseCase> createState() => _AfterLayoutUseCaseState();
}

class _AfterLayoutUseCaseState extends State<AfterLayoutUseCase>
    with AfterLayout {
  // final _key = UniqueKey();
  final _key = GlobalKey();

  double width = 0.0;
  double height = 0.0;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Size  : $width X $height \n Ad officia sint ea proident eiusmod'
      'voluptate officia consequat do. Labore Lorem anim incididunt'
      'reprehenderit sit ullamco Lorem et aliqua sunt excepteur velit.'
      'Exercitation cupidatat consectetur do aliqua do deserunt qui eiusmod.'
      ' Nisi cupidatat ullamco eiusmod duis.',
      key: _key,
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final ro = _key.currentContext?.findRenderObject() as RenderBox?;
    setState(() {
      width = ro?.size.width ?? 0.0;
      height = ro?.size.height ?? 0.0;
    });
  }
}

/* 
// ValueKey
final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return ListTile(
        key: ValueKey(items[index]),
        title: Text(items[index]),
      );
    },
  );
}
Use code with caution. Learn more
Dart
// ObjectKey
final List<Person> people = [
  Person(name: 'Alice'),
  Person(name: 'Bob'),
  Person(name: 'Carol'),
];

Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: people.length,
    itemBuilder: (context, index) {
      return ListTile(
        key: ObjectKey(people[index].name),
        title: Text(people[index].name),
      );
    },
  );
}
Use code with caution. Learn more
Dart
// UniqueKey
Widget build(BuildContext context) {
  return FloatingActionButton(
    key: UniqueKey(),
    onPressed: () {
      // Do something
    },
  );
}
Use code with caution. Learn more
Dart
// GlobalKey
final GlobalKey<AnimatedContainerState> _containerKey = GlobalKey();

Widget build(BuildContext context) {
  return AnimatedContainer(
    key: _containerKey,
    width: 100,
    height: 100,
    color: Colors.red,
  );
}

void _changeColor() {
  _containerKey.currentState?.setState(() {
    _containerKey.currentState?.color = Colors.blue;
  });
}
*/