import 'package:flutter/material.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    print(route);
    print(previousRoute);
  }
}
