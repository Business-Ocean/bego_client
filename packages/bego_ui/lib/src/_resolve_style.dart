import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:bego_ui/src/themes/be_theme_data.dart';
import 'package:flutter/material.dart';

typedef ResolveTextStyle = TextStyle Function(BeBreakpoint);
typedef ResolveInsets = EdgeInsets Function(BeBreakpoint);
typedef ResolveWidget = Widget Function(BeBreakpoint, BeThemeData);
