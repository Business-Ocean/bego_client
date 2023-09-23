import 'dart:async';

import 'package:flutter/material.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) afterLayoutBuild(context);
      },
    );
  }

  FutureOr<void> afterLayoutBuild(BuildContext context);
}
