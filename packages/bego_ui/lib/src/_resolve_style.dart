import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:bego_ui/src/themes/be_theme_data.dart';
import 'package:flutter/material.dart';

typedef ResolveTextStyle = TextStyle Function(Breakpoint);
typedef ResolveInsets = EdgeInsets Function(Breakpoint);
typedef ResolveWidget = Widget Function(Breakpoint, BeThemeData);
