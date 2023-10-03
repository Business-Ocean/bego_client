import 'dart:math' as math;

import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:bego_ui/src/notification/be_inline_notification.dart';
import 'package:flutter/material.dart';

/// [BeNotificationsOverlay] is an overlay that wraps [child] inside a
/// stack and provides a method to show an in-app notification.
///
/// The position of notifications is determined by [BeNotificationPosition]
/// and by default is set to [BeNotificationPosition.topRight].
/// You can change the maximum visible count [maxVisible] when declaring the
/// overlay. Notifications that could not be shown because of the [maxVisible]
/// limit will be put into a queue and will be dispatched in the order they were
/// added.
class BeNotificationsOverlay extends StatefulWidget {
  const BeNotificationsOverlay({
    super.key,
    required this.child,
    this.maxVisible = _defaultMaxVisibleCount,
    this.position = BeNotificationPosition.topRight,
  });

  final BeNotificationPosition position;
  final Widget child;
  final int maxVisible;

  static BeNotificationManager? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_BeNotificationData>()
      ?.manager;

  @override
  State<StatefulWidget> createState() => _BeNotificationsOverlayState();
}

class _BeNotificationsOverlayState extends State<BeNotificationsOverlay>
    implements BeNotificationManager {
  late final List<BeInlineNotification> _notifications = [];
  late final List<BeInlineNotification> _queue = [];
  late final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void show(BeInlineNotification notification) {
    if (_notifications.length < widget.maxVisible) {
      _addNotification(notification);
    } else {
      _queue.add(notification);
    }
  }

  @override
  void remove(BeInlineNotification notification) {
    final index = _notifications.indexOf(notification);
    if (index != -1) {
      _notifications.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) =>
            _buildRemovedNotification(animation, notification),
        duration: _leavingAnimationDuration,
      );
    }
  }

  void _addNotification(
    BeInlineNotification notification, {
    int index = 0,
  }) {
    _notifications.insert(index, notification);
    _listKey.currentState?.insertItem(index, duration: _animationDuration);
    Future<void>.delayed(_autoDismissDuration, () {
      if (_notifications.contains(notification)) {
        remove(notification);
      }
    });
  }

  void _handleNotificationDismiss() {
    if (_queue.isNotEmpty && _notifications.length < widget.maxVisible) {
      _addNotification(_queue.removeAt(0));
    }
  }

  _AnimatedNotification _buildRemovedNotification(
    Animation<double> animation,
    BeInlineNotification notification,
  ) {
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.dismissed) {
          _handleNotificationDismiss();
        }
      },
    );

    return _AnimatedNotification(
      animation: animation,
      notification: notification,
      isOutgoing: true,
      slideTween: widget.position.slideTween,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.of(context).screenBreakPoint.index <=
        BeBreakpoint.medium.index;

    return Builder(
      builder: (context) => _BeNotificationData(
        this,
        child: Stack(
          children: [
            widget.child,
            Positioned(
              left: widget.position.left(isCompact),
              top: widget.position.top(isCompact),
              right: widget.position.right(isCompact),
              bottom: widget.position.bottom(isCompact),
              child: SafeArea(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: _maxWidth),
                  child: AnimatedList(
                    key: _listKey,
                    shrinkWrap: true,
                    reverse: widget.position.reverse,
                    itemBuilder: (context, index, animation) =>
                        _AnimatedNotification(
                      animation: animation,
                      notification: _notifications[index],
                      slideTween: widget.position.slideTween,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class BeNotificationManager {
  void show(BeInlineNotification notification);
  void remove(BeInlineNotification notification);
}

class _BeNotificationData extends InheritedWidget {
  const _BeNotificationData(
    this.manager, {
    required super.child,
  });

  final BeNotificationManager manager;

  @override
  bool updateShouldNotify(_BeNotificationData oldWidget) => false;
}

class _AnimatedNotification extends StatelessWidget {
  const _AnimatedNotification({
    required this.animation,
    required this.notification,
    required this.slideTween,
    this.isOutgoing = false,
  });

  final Animation<double> animation;
  final BeInlineNotification notification;
  final Tween<Offset> slideTween;
  final bool isOutgoing;

  @override
  Widget build(BuildContext context) => IgnorePointer(
        ignoring: isOutgoing,
        child: FadeTransition(
          opacity: animation,
          child: _NoClipSizeTransition(
            sizeFactor: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutQuart,
            ),
            child: SlideTransition(
              position: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
              ).drive(slideTween),
              child: Center(
                child: notification,
              ),
            ),
          ),
        ),
      );
}

/// Similar to [ScaleTransition], but without clipping.
class _NoClipSizeTransition extends AnimatedWidget {
  const _NoClipSizeTransition({
    required Animation<double> sizeFactor,
    this.child,
  }) : super(listenable: sizeFactor);

  final Widget? child;

  Animation<double> get sizeFactor => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) => Align(
        alignment: AlignmentDirectional.centerStart,
        heightFactor: math.max(sizeFactor.value, 0.0),
        child: child,
      );
}

/// The position of the notifications.
enum BeNotificationPosition { topLeft, topRight, bottomRight, bottomLeft }

extension on BeNotificationPosition {
  double? left(bool isCompact) {
    switch (this) {
      case BeNotificationPosition.bottomLeft:
      case BeNotificationPosition.topLeft:
        return isCompact ? 0 : 4;
      case BeNotificationPosition.topRight:
      case BeNotificationPosition.bottomRight:
        return isCompact ? 0 : null;
    }
  }

  double? top(bool isCompact) {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.topRight:
        return isCompact ? 0 : 4;
      case BeNotificationPosition.bottomRight:
      case BeNotificationPosition.bottomLeft:
        return null;
    }
  }

  double? right(bool isCompact) {
    switch (this) {
      case BeNotificationPosition.bottomRight:
      case BeNotificationPosition.topRight:
        return isCompact ? 0 : 4;
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.bottomLeft:
        return isCompact ? 0 : null;
    }
  }

  double? bottom(bool isCompact) {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.topRight:
        return null;
      case BeNotificationPosition.bottomRight:
      case BeNotificationPosition.bottomLeft:
        return isCompact ? 0 : 4;
    }
  }

  Tween<Offset> get slideTween {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.bottomLeft:
        return Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero);
      case BeNotificationPosition.topRight:
      case BeNotificationPosition.bottomRight:
        return Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
    }
  }

  bool get reverse {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.topRight:
        return false;
      case BeNotificationPosition.bottomLeft:
      case BeNotificationPosition.bottomRight:
        return true;
    }
  }
}

const Duration _animationDuration = Duration(milliseconds: 300);
const Duration _leavingAnimationDuration = Duration(milliseconds: 200);
const Duration _autoDismissDuration = Duration(seconds: 8);
const int _defaultMaxVisibleCount = 3;
const double _maxWidth = 360;
