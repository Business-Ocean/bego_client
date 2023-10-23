// ignore_for_file: prefer_asserts_with_message, avoid_catches_without_on_clauses, comment_references

import 'dart:async';

import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

///***********
///*Description: You can safely dismiss the Dialog tool class.
///*Secondary encapsulation can be performed based on this class, similar to the show and dismiss methods of [BeLoadingDialog]
///*
///*Note: If you want to delete the specified Dialog, you must pass the tag in the show and dismiss methods.
///***********
class BeSafeDialog {
  static const String _safeDialogDefaultTag = '_safeDialogDefaultTag';

  ///According to the tag, the queue status of a certain type of Dialog is distinguished
  static final Map<String, List<_SafeDialogRoute<dynamic>>> _dialogStates = {};

  ///Used to close a Dialog and only remove the last Dialog in the corresponding tag list.
  ///[tag]: Dialog used to remove the corresponding tag
  ///
  ///Notice,
  ///1. Direct remove will not call the then callback of push future, and use Completer to forward;
  ///2. When the router is not in the queue, an exception will be thrown, catch and print the exception log.
  static void dismiss<T extends Object?>({
    required BuildContext context,
    String tag = _safeDialogDefaultTag,
    T? result,
  }) {
    final typeStates = _dialogStates[tag] ??= [];
    if (typeStates.isNotEmpty) {
      try {
        final safeDialogRoute = typeStates.removeLast();
        Navigator.removeRoute(context, safeDialogRoute);
        if (!safeDialogRoute.completer.isCompleted) {
          safeDialogRoute.completer.complete(result);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  ///Show Dialog
  ///[tag]: used to mark the Dialog type
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    String tag = _safeDialogDefaultTag,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));
    final themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(
        context,
        rootNavigator: useRootNavigator,
      ).context,
    );

    final safeDialogRoute = _SafeDialogRoute<T>(
      context: context,
      builder: builder,
      barrierColor: barrierColor ??
          BeTheme.of(context).colors.lightInverse.withOpacity(0.1),
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      themes: themes,
    );
    //Notice:
    //Key points, manual management of Router
    //Forward the results through Completer
    _dialogStates[tag] ??= [];
    _dialogStates[tag]?.add(safeDialogRoute);
    final _ = Navigator.of(context, rootNavigator: useRootNavigator)
        .push<T>(safeDialogRoute)
      ..then((result) {
        _dialogStates[tag]?.remove(safeDialogRoute);
        if (!safeDialogRoute.completer.isCompleted) {
          safeDialogRoute.completer.complete(result);
        }
      });
    return safeDialogRoute.completer.future;
  }
}

///Based on DialogRoute, Completer is simply encapsulated for forwarding Route results.
class _SafeDialogRoute<T> extends DialogRoute<T> {
  _SafeDialogRoute({
    required super.context,
    required super.builder,
    super.themes,
    super.barrierColor,
    super.barrierDismissible,
    super.barrierLabel,
    super.useSafeArea,
    super.settings,
  });

  /// Forward Route results
  final Completer<T?> completer = Completer<T?>();
}
