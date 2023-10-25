import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BeTheme(
      child: MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Devfest'),
          ),
          body: Center(
            child: BeNotification(
              title: 'Welcome to Flutter',
              description: ' Fugiat sunt excepteur dolor ad est elit tempor. ',
              action: 'ok',
              icon: BeIcons.icon_at,
              onActionPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
