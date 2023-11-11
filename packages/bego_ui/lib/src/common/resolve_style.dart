import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:flutter/material.dart';

typedef ResolveTextStyle = TextStyle Function(BeBreakpoint);
typedef ResolveInsets = EdgeInsets Function(BeBreakpoint);
typedef ResolveThemeWidget = Widget Function(BeBreakpoint, BeThemeData);
typedef ResolveWidget = Widget Function(BeBreakpoint);
