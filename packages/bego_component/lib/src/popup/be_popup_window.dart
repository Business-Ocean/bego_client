// ignore_for_file: library_private_types_in_public_api

import 'dart:core';

import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///The popup window is located in the direction of targetView
enum BePopupDirection {
  ///Arrow points up
  top,

  ///Arrow pointing down
  bottom
}

///General Popup Window prompt, with triangle number
class BePopupWindow extends StatefulWidget {
  ///Context of the attached component
  final BuildContext context;

  ///The height of the arrow, default 6
  final double arrowHeight;

  ///Text to display
  final String? text;

  ///The GlobalKey held by the attached component and the BePopUpWindow component
  final GlobalKey popKey;

  ///The style of text to be displayed
  final TextStyle? textStyle;

  ///The background color of popUpWindow. When using the [showPopWindow] method, the default value is Color(0xFF1A1A1A)
  final Color? backgroundColor;

  ///Border color, when using [showPopWindow] method, the default value is Colors.transparent
  final Color? borderColor;

  ///Whether there is a close icon, the default is false, not displayed
  final bool isShowCloseIcon;

  ///Offset from targetView, default is 0
  final double offset;

  ///popUpWindow is located in the direction of targetView, the default is [BePopupDirection.bottom]
  final BePopupDirection popDirection;

  ///Custom widget
  final Widget? widget;

  ///Container inner margins, the default is EdgeInsets.only(left: 18, top: 14, right: 18, bottom: 14)
  final EdgeInsets paddingInsets;

  ///Container rounded corners, default is 4
  final double borderRadius;

  ///Whether multiple lines can be displayed, default false, single line display
  final bool canWrap;

  ///Distance from targetView edge, default 20
  final double spaceMargin;

  ///The absolute offset of the arrow icon in the horizontal direction. If it is null, it will be automatically calculated.
  final double? arrowOffset;

  ///When the distance between popWindow and the bottom is less than this value,
  ///Automatically popup popWindow on targetView
  final double turnOverFromBottom;

  const BePopupWindow(this.context,
      {Key? key,
      this.text,
      required this.popKey,
      this.arrowHeight = 6.0,
      this.textStyle,
      this.backgroundColor,
      this.isShowCloseIcon = false,
      this.offset = 0,
      this.popDirection = BePopupDirection.bottom,
      this.widget,
      this.paddingInsets =
          const EdgeInsets.only(left: 18, top: 14, right: 18, bottom: 14),
      this.borderRadius = 12,
      this.borderColor,
      this.canWrap = false,
      this.spaceMargin = 20,
      this.arrowOffset,
      this.turnOverFromBottom = 50.0})
      : super(key: key);

  ///Display popUpWindow
  ///[text] The text content displayed
  ///[popKey] The GlobalKey held by the attached component and the BePopUpWindow component
  ///[popDirection] The direction of the arrow
  ///[arrowHeight] The height of the arrow, default 6
  ///[textStyle] text style
  ///[backgroundColor] The background color of popUpWindow, default Color(0xFF1A1A1A)
  ///[hasCloseIcon] Whether to display the close icon, the default is false, not displayed
  ///[offset] Vertical offset from targetView
  ///[widget] Custom pop view
  ///[paddingInsets] Container inner margins, default is EdgeInsets.only(left: 18, top: 14, right: 18, bottom: 14)
  ///[borderRadius] Container rounded corners, default is 4
  ///[borderColor] Border color, default is Colors.transparent
  ///[borderWidth] border width, default is 1
  ///[canWrap] Whether multiple lines can be displayed, default false, single line display
  ///[spaceMargin] distance from the targetView edge, default 20
  ///[arrowOffset] The absolute offset of the arrow icon in the horizontal direction. If it is null, it will be automatically calculated.
  ///[dismissCallback] popUpWindow disappears callback, this callback will be executed after pop
  ///[turnOverFromBottom] When popWindow is less than this value, popWindow will automatically pop up on targetView. Default is 50
  static void showPopWindow(context, GlobalKey popKey, String? text,
      {BePopupDirection popDirection = BePopupDirection.bottom,
      double arrowHeight = 6.0,
      TextStyle? textStyle =
          const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
      Color? backgroundColor = BegoColors.blueGray900,
      bool hasCloseIcon = false,
      double offset = 0,
      Widget? widget,
      EdgeInsets paddingInsets =
          const EdgeInsets.only(left: 18, top: 14, right: 18, bottom: 14),
      double borderRadius = 8,
      Color? borderColor = Colors.transparent,
      double borderWidth = 1,
      bool canWrap = false,
      double spaceMargin = 20,
      double? arrowOffset,
      VoidCallback? dismissCallback,
      double turnOverFromBottom = 50.0}) {
    assert(popKey.currentContext != null &&
        popKey.currentContext!.findRenderObject() != null);
    if (popKey.currentContext == null ||
        popKey.currentContext!.findRenderObject() == null) return;
    Navigator.push(
        context,
        BePopupRoute(
            child: BePopupWindow(
          context,
          arrowHeight: arrowHeight,
          text: text,
          popKey: popKey,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          isShowCloseIcon: hasCloseIcon,
          offset: offset,
          popDirection: popDirection,
          widget: widget,
          paddingInsets: paddingInsets,
          borderRadius: borderRadius,
          borderColor: borderColor ?? Colors.transparent,
          canWrap: canWrap,
          spaceMargin: spaceMargin,
          arrowOffset: arrowOffset,
          turnOverFromBottom: turnOverFromBottom,
        )));
  }

  @override
  _BePopupWindowState createState() => _BePopupWindowState();
}

class _BePopupWindowState extends State<BePopupWindow> {
  ///The position of targetView
  Rect _showRect = Rect.zero;

  ///Screen size
  late Size _screenSize;

  ///Spacing between arrows and left and right sidelines
  final double _arrowSpacing = 18;

  ///Whether to extend to the right, true: extend to the right, false: extend to the left
  bool _expandedRight = true;

  ///The specific position of popUpWindow on both sides of the center line
  double _left = 0;
  double _right = 0;
  double _top = 0;
  double _bottom = 0;

  ///Arrow display direction
  late BePopupDirection _popDirection;

  ///Remove the border color from transparency
  late Color _borderColor;

  ///Remove the background color of transparency
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _showRect = _getWidgetGlobalRect(widget.popKey);
    _screenSize = PlatformDispatcher.instance.views.first.physicalSize /
        PlatformDispatcher.instance.views.first.devicePixelRatio;
    _borderColor = (widget.borderColor ?? Colors.transparent).withAlpha(255);
    _backgroundColor =
        (widget.backgroundColor ?? Colors.transparent).withAlpha(255);
    _popDirection = widget.popDirection;
    _calculateOffset();
  }

  //Get the position of targetView
  Rect _getWidgetGlobalRect(GlobalKey key) {
    try {
      BuildContext? ctx = key.currentContext;
      RenderObject? renderObject = ctx?.findRenderObject();
      RenderBox renderBox = renderObject as RenderBox;
      var offset = renderBox.localToGlobal(Offset.zero);
      return Rect.fromLTWH(
          offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
    } catch (e) {
      debugPrint('Exception in obtaining size information');
      return Rect.zero;
    }
  }

  //Calculate the position displayed by popUpWindow
  void _calculateOffset() {
    if (_showRect.center.dx < _screenSize.width / 2) {
      //popUpWindow extends to the right
      _expandedRight = true;
      _left = _showRect.left;
    } else {
      //popUpWindow extends to the left
      _expandedRight = false;
      _right = _screenSize.width - _showRect.right + widget.spaceMargin;
    }
    if (_popDirection == BePopupDirection.bottom) {
      //Below targetView
      _top = _showRect.height + _showRect.top + widget.offset;
      if ((_screenSize.height - _top) < widget.turnOverFromBottom) {
        _popDirection = BePopupDirection.top;
        _bottom = _screenSize.height - _showRect.top + widget.offset;
      }
    } else if (_popDirection == BePopupDirection.top) {
      //Above targetView
      _bottom = _screenSize.height - _showRect.top + widget.offset;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      excluding: true,
      child: WillPopScope(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  _buildPopWidget(context),
                  //triangle arrow
                  _buildArrowWidget(),
                ],
              ),
            ),
          ),
          onWillPop: () {
            return Future.value(true);
          }),
    );
  }

  //draw arrow
  Widget _buildArrowWidget() {
    return _expandedRight
        ? Positioned(
            left: widget.arrowOffset ??
                _left +
                    (_showRect.width - _arrowSpacing) / 2 -
                    widget.spaceMargin,
            top: _popDirection == BePopupDirection.bottom
                ? _top - widget.arrowHeight
                : null,
            bottom: _popDirection == BePopupDirection.top
                ? _bottom - widget.arrowHeight
                : null,
            child: CustomPaint(
              size: Size(15.0, widget.arrowHeight),
              painter: _TrianglePainter(
                  isDownArrow: _popDirection == BePopupDirection.top,
                  color: _backgroundColor,
                  borderColor: _borderColor),
            ),
          )
        : Positioned(
            right: widget.arrowOffset ??
                _right +
                    (_showRect.width - _arrowSpacing) / 2 -
                    widget.spaceMargin,
            top: _popDirection == BePopupDirection.bottom
                ? _top - widget.arrowHeight
                : null,
            bottom: _popDirection == BePopupDirection.top
                ? _bottom - widget.arrowHeight
                : null,
            child: CustomPaint(
              size: Size(15.0, widget.arrowHeight),
              painter: _TrianglePainter(
                  isDownArrow: _popDirection == BePopupDirection.top,
                  color: _backgroundColor,
                  borderColor: _borderColor),
            ),
          );
  }

  //Popup style of popupWindow
  Widget _buildPopWidget(BuildContext context) {
    //Status bar height
    double statusBarHeight =
        MediaQueryData.fromView(View.of(context)).padding.top;
    return Positioned(
        left: _expandedRight ? _left : null,
        right: _expandedRight ? null : _right,
        top: _popDirection == BePopupDirection.bottom ? _top : null,
        bottom: _popDirection == BePopupDirection.top ? _bottom : null,
        child: Container(
            padding: widget.paddingInsets,
            decoration: BoxDecoration(
                color: _backgroundColor,
                // border: Border.all(color: _borderColor, width: 0.5),
                borderRadius: BorderRadius.circular(widget.borderRadius)),
            constraints: BoxConstraints(
                maxWidth: _expandedRight
                    ? _screenSize.width - _left
                    : _screenSize.width - _right,
                maxHeight: _popDirection == BePopupDirection.bottom
                    ? _screenSize.height - _top
                    : _screenSize.height - _bottom - statusBarHeight),
            child: widget.widget ??
                SingleChildScrollView(
                    child: widget.canWrap
                        ? RichText(
                            text: TextSpan(children: <InlineSpan>[
                            TextSpan(
                                text: widget.text, style: widget.textStyle),
                            widget.isShowCloseIcon
                                ? const WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 6),
                                        child: Icon(Icons.close)))
                                : const TextSpan(text: "")
                          ]))
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  widget.text ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: widget.textStyle,
                                ),
                              ),
                              widget.isShowCloseIcon
                                  ? const Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Icon(Icons.close),
                                    )
                                  : const Text("")
                            ],
                          ))));
  }
}

//draw arrow
class _TrianglePainter extends CustomPainter {
  bool isDownArrow;
  Color color;
  Color borderColor;

  _TrianglePainter({
    required this.isDownArrow,
    required this.color,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.strokeWidth = 2.0;
    paint.color = color;
    paint.style = PaintingStyle.fill;

    if (isDownArrow) {
      path.moveTo(0.0, -1.5);
      path.lineTo(size.width / 2.0, size.height);
      path.lineTo(size.width, -1.5);
    } else {
      path.moveTo(0.0, size.height + 1.5);
      path.lineTo(size.width / 2.0, 0.0);
      path.lineTo(size.width, size.height + 1.5);
    }

    canvas.drawPath(path, paint);
    Paint paintBorder = Paint();
    Path pathBorder = Path();
    paintBorder.strokeWidth = 0.5;
    paintBorder.color = borderColor;
    paintBorder.style = PaintingStyle.stroke;

    if (isDownArrow) {
      pathBorder.moveTo(0.0, -0.5);
      pathBorder.lineTo(size.width / 2.0, size.height);
      pathBorder.lineTo(size.width, -0.5);
    } else {
      pathBorder.moveTo(0.5, size.height + 0.5);
      pathBorder.lineTo(size.width / 2.0, 0);
      pathBorder.lineTo(size.width - 0.5, size.height + 0.5);
    }

    canvas.drawPath(pathBorder, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BePopupRoute extends PopupRoute {
  final Duration _duration = const Duration(milliseconds: 200);
  Widget child;

  BePopupRoute({required this.child});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}

///Callback when each Item in the popup is clicked, and determines whether to intercept the click event
///[index] Index of Item
///[item] Item content
///Return true to intercept the click event and no longer use pop logic.
typedef BePopupListItemClick = bool Function(int index, String item);

///popup is used to construct custom Item
///[index] Index of Item
///[item] Item content
typedef BePopupListItemBuilder = Widget? Function(int index, String item);

///Pop-up window list tool class based on PopUpWindow
class BePopupListWindow {
  ///Popup List Window with itemBuilder
  ///[popKey] The GlobalKey held by the attached component and the BePopUpWindow component
  ///[data] List of text data to be displayed
  ///[popDirection] The direction of the arrow
  ///[itemBuilder] Custom item construction method
  ///[onItemClick] item click callback
  ///[onItemClickInterceptor] item click interception callback
  ///[onDismiss] popUpWindow disappears callback
  static void showButtonPanelPopList(
    context,
    GlobalKey popKey, {
    List<String>? data,
    BePopupDirection popDirection = BePopupDirection.bottom,
    BePopupListItemBuilder? itemBuilder,
    BePopupListItemClick? onItemClick,
    VoidCallback? onDismiss,
  }) {
    TextStyle textStyle = BeTheme.of(context).bestyle.bodyMedium;
    double arrowHeight = 6.0;
    Color borderColor = const Color(0xffCCCCCC);
    Color backgroundColor = Colors.white;
    double offset = 4;
    double spaceMargin = -10;
    double minWidth = 100;
    double maxWidth = 150;
    double maxHeight = 200;
    double borderRadius = 4;
    bool hasCloseIcon = true;
    assert(popKey.currentContext != null &&
        popKey.currentContext!.findRenderObject() != null);
    if (popKey.currentContext == null ||
        popKey.currentContext!.findRenderObject() == null) return;
    Navigator.push(
        context,
        BePopupRoute(
            child: BePopupWindow(
          context,
          arrowHeight: arrowHeight,
          popKey: popKey,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          isShowCloseIcon: hasCloseIcon,
          offset: offset,
          widget: data?.isEmpty ?? false
              ? Container(
                  constraints:
                      BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
                )
              : Container(
                  constraints:
                      BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Column(
                        children: _getItems(context, minWidth, maxWidth,
                            itemBuilder, textStyle, data!, (index, item) {
                          if (onItemClick != null) {
                            bool isIntercept = onItemClick(index, item);
                            if (isIntercept) return;
                          }
                          Navigator.pop(
                              context, {'index': index, 'item': item});
                        }),
                      ),
                    ),
                  ),
                ),
          popDirection: popDirection,
          borderRadius: borderRadius,
          borderColor: borderColor,
          spaceMargin: spaceMargin,
        ))).then((result) {
      if (onDismiss != null) {
        onDismiss();
      }
    });
  }

  ///Display Popup List Window
  ///[popKey] The GlobalKey held by the attached component and the BePopUpWindow component
  ///[data] List of text data to be displayed
  ///[popDirection] The direction of the arrow
  ///[offset] offset from targetView
  ///[onItemClick] item click callback
  ///[onItemClickInterceptor] item click interception callback
  ///[onDismiss] popUpWindow disappears callback
  static void showPopListWindow(context, GlobalKey popKey,
      {List<String>? data,
      BePopupDirection popDirection = BePopupDirection.bottom,
      double offset = 0,
      double? arrowOffset,
      BePopupListItemClick? onItemClick,
      VoidCallback? onDismiss}) {
    assert(popKey.currentContext != null &&
        popKey.currentContext!.findRenderObject() != null);
    if (popKey.currentContext == null ||
        popKey.currentContext!.findRenderObject() == null) return;

    double arrowHeight = 6.0;
    double borderRadius = 4;
    double spaceMargin = 0;
    double minWidth = 100;
    double maxWidth = 150;
    double maxHeight = 200;
    Color borderColor = BeTheme.of(context).becolors.hint;
    Color backgroundColor = Colors.white;
    TextStyle textStyle = TextStyle(color: BeTheme.of(context).becolors.text);
    bool hasCloseIcon = true;

    Navigator.push(
      context,
      BePopupRoute(
        child: BePopupWindow(
          context,
          arrowHeight: arrowHeight,
          popKey: popKey,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          arrowOffset: arrowOffset,
          isShowCloseIcon: hasCloseIcon,
          offset: offset,
          widget: data?.isEmpty ?? false
              ? Container(
                  constraints:
                      BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
                )
              : Container(
                  constraints:
                      BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Column(
                        children: _getItems(
                            context, minWidth, maxWidth, null, textStyle, data!,
                            (index, item) {
                          if (onItemClick != null) {
                            bool isIntercept = onItemClick(index, item);
                            if (isIntercept) return;
                          }
                          Navigator.pop(context);
                        }),
                      ),
                    ),
                  ),
                ),
          popDirection: popDirection,
          borderRadius: borderRadius,
          borderColor: borderColor,
          spaceMargin: spaceMargin,
        ),
      ),
    ).then((result) {
      if (onDismiss != null) {
        onDismiss();
      }
    });
  }

  static List<Widget> _getItems(
      BuildContext context,
      double minWidth,
      double maxWidth,
      BePopupListItemBuilder? itemBuilder,
      TextStyle textStyle,
      List<String> data,
      void Function(int index, String item) onItemClick) {
    double textMaxWidth = _getMaxWidth(textStyle, data);
    if (textMaxWidth + 52 < minWidth) {
      textMaxWidth = minWidth;
    } else if (textMaxWidth + 52 > maxWidth) {
      textMaxWidth = maxWidth;
    } else {
      textMaxWidth = textMaxWidth + 52;
    }
    return data.map((f) {
      return GestureDetector(
          onTap: () {
            onItemClick(data.indexOf(f), f);
          },
          child: Container(
              width: textMaxWidth,
              alignment: Alignment.center,
              color: Colors.transparent,
              padding:
                  const EdgeInsets.only(left: 26, right: 26, top: 6, bottom: 6),
              child: _getTextWidget(itemBuilder, data, f, textStyle)));
    }).toList();
  }

  ///Traverse the data, calculate the content of each Item, and return the maximum display width of all Items
  static double _getMaxWidth(TextStyle textStyle, List<String> data) {
    double maxWidth = 0;
    if (data.isEmpty) {
      Size? maxWidthSize;
      for (String entity in data) {
        Size size = BeTextUtil.textSize(entity, textStyle);
        if (maxWidthSize == null) {
          maxWidthSize = size;
        } else {
          if (maxWidthSize.width < size.width) {
            maxWidthSize = size;
          }
        }
      }
      if (maxWidthSize != null) {
        maxWidth = maxWidthSize.width;
      }
    }
    return maxWidth;
  }

  static Widget _getTextWidget(BePopupListItemBuilder? itemBuilder,
      List<String> data, String text, TextStyle textStyle) {
    if (itemBuilder == null) {
      return _getDefaultText(text, textStyle);
    } else {
      return itemBuilder(data.indexOf(text), text) ??
          _getDefaultText(text, textStyle);
    }
  }

  static Text _getDefaultText(String text, TextStyle textStyle) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: textStyle,
    );
  }
}
