import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

// (() => Text('data')()),
// https://stackoverflow.com/questions/49713189/how-to-use-conditional-statement-within-child-attribute-of-a-flutter-widget-cen
typedef IfTrueWidget = List<Widget> Function(bool, Widget);

typedef IfNullWidget = Widget Function(Widget?);

typedef IfTrueWidgets = List<Widget> Function(bool, List<Widget>);

typedef IfElseWidget = Widget Function(bool, Widget, Widget);

typedef IfWidget = Widget Function(bool, Widget);

typedef IfWidgets = List<Widget> Function(bool, List<Widget>);

typedef IfAnyWidget = Widget Function(List<bool>, Widget);

typedef IfAllWidget = Widget Function(List<bool>, Widget);

typedef IfTrueThenShowWidgets = List<Widget> Function(bool, List<Widget>);

typedef IfTextWidget = Widget? Function(String?, Widget);

typedef WidgetBlock = Widget Function(Widget Function());

typedef ConditionStyleTextWidget = Text Function(
  bool,
  String,
  TextStyle,
  TextStyle,
);

//  switch case
typedef SwitchCondition = Widget Function();

//===

IfTrueWidget ifTrueWidget =
    (bool condition, Widget child) => [if (condition) child];

IfTrueWidgets ifTrueWidgets =
    (bool condition, List<Widget> children) => [if (condition) ...children];

IfElseWidget ifElseWidget =
    (bool condition, Widget isTrueChild, Widget isFalseChild) =>
        condition ? isTrueChild : isFalseChild;

IfWidget ifWidget = (bool condition, Widget isTrueChild) =>
    condition ? isTrueChild : emptyWidget;

IfWidgets ifWidgets = (bool condition, List<Widget> children) =>
    condition ? children : [emptyWidget];

IfAnyWidget ifAnyWidget = (List<bool> ifAnyconditions, Widget isTrueChild) =>
    ifAnyconditions.firstWhere((e) => e, orElse: () => false)
        ? isTrueChild
        : emptyWidget;

IfAllWidget ifAllWidget = (List<bool> ifAllconditions, Widget isTrueChild) =>
    ifAllconditions.firstWhere((e) => !e, orElse: () => true)
        ? isTrueChild
        : emptyWidget;

IfTrueThenShowWidgets ifTrueThenShowWidgets =
    (bool condition, List<Widget> children) => condition ? children : [];

ConditionStyleTextWidget conditionStyleTextWidget =
    (bool condition, String text, TextStyle ifStyle, TextStyle elseStyle) =>
        Text(
          text,
          style: condition ? ifStyle : elseStyle,
        );

WidgetBlock widgetBlock = (Widget Function() function) => function();

Widget swithchWidget<Value>(
  Value value,
  Map<Value, Widget> variations,
  Widget defaultWidget,
) {
  final widget = variations[value];
  if (widget != null) return widget;

  return defaultWidget;
}

Value? swithchRetrun<Key, Value>(
  Key key,
  Map<Key, Value> variations,
  Value defaultValue,
) {
  final object = variations[key];
  if (object != null) return object;

  return defaultValue;
}

IfTextWidget ifTextWidgets = (String? text, Widget child) =>
    text != null && text.trim().isNotEmpty ? child : null;

IfNullWidget ifNullWidget = (Widget? child) => child ?? emptyWidget;
