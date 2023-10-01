// ignore_for_file: library_private_types_in_public_api, comment_references

import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef TextExpandedCallback = void Function(bool);

///Text panel with expand and collapse function
///
///Layout rules:
///There are more or collapse buttons in the lower right corner of the text
///When the text exceeds the specified [maxLines], the remaining text is hidden
///Click more to display all text
///
///```dart
///BeTextExpand(
///text: 'There are more or collapse buttons in the lower right corner of the text',
///)
///
///BeTextExpand(
///text: 'A text panel with expand and collapse functions, with more or collapse buttons in the lower right corner of the text',
///maxLines: 2,
///onExpanded: (value) {
///},
///)
///
///
///```
///
///The relevant text components are as follows:
///*[BeBubbleText], bubble background expand and collapse text component
///*[BeInsertInfo], the text component of the bubble background
///
class BeTextMore extends StatefulWidget {
  const BeTextMore({
    super.key,
    required this.text,
    this.maxLines = 1000000,
    this.textStyle,
    this.onExpanded,
    this.color,
  });

  ///displayed text
  final String text;

  ///Maximum number of lines displayed
  final int? maxLines;

  ///Text style
  final TextStyle? textStyle;

  ///Callback when expanding or collapsing
  final TextExpandedCallback? onExpanded;

  ///The initial color of the gradient color of more buttons is white by default.
  final Color? color;

  @override
  _BeTextMoreState createState() => _BeTextMoreState();
}

class _BeTextMoreState extends State<BeTextMore> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final style = _defaultTextStyle();
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(text: widget.text, style: style);
        final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
          ellipsis: 'EllipseText',
        )..layout(maxWidth: size.maxWidth);
        if (tp.didExceedMaxLines) {
          if (_expanded) {
            return _expandedText(context, widget.text);
          } else {
            return _foldedText(context, widget.text);
          }
        } else {
          return _regularText(widget.text, style);
        }
      },
    );
  }

  Widget _foldedText(BuildContext context, String text) => Stack(
        children: <Widget>[
          Text(
            widget.text,
            style: _defaultTextStyle(),
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: _clickExpandTextWidget(context),
          ),
        ],
      );

  Widget _clickExpandTextWidget(context) {
    final btnColor = widget.color ?? Colors.white;
    final textTheme = widget.textStyle ?? betheme.bestyle.bodyMedium;

    final tx = Text(
      '...more',
      style: textTheme.copyWith(color: BegoColors.blue, letterSpacing: 1),
    );
    final cnt = Container(
      padding: const EdgeInsets.only(left: 22),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [btnColor.withAlpha(100), btnColor, btnColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: tx,
    );
    return GestureDetector(
      child: cnt,
      onTap: () {
        setState(() {
          _expanded = true;
          if (null != widget.onExpanded) {
            widget.onExpanded!(_expanded);
          }
        });
      },
    );
  }

  Widget _expandedText(BuildContext context, String text) {
    final style = _defaultTextStyle();
    return RichText(
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
        text: text,
        style: style,
        children: [
          const WidgetSpan(child: SizedBox(width: 5, height: 5)),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.keyboard_arrow_up,
                size: style.fontSize,
                color: BegoColors.amber,
              ),
            ),
          ),
          _foldButtonSpan(context),
        ],
      ),
    );
  }

  TextStyle _defaultTextStyle() {
    final style = widget.textStyle ?? betheme.bestyle.bodyMedium;
    return style;
  }

  InlineSpan _foldButtonSpan(context) {
    final textTheme = widget.textStyle ?? betheme.bestyle.bodyMedium;

    return TextSpan(
      text: 'less',
      style: textTheme.copyWith(color: BegoColors.amber, letterSpacing: 1),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          setState(() {
            _expanded = false;
            if (null != widget.onExpanded) {
              widget.onExpanded!(_expanded);
            }
          });
        },
    );
  }

  Widget _regularText(String text, TextStyle style) => Text(text, style: style);
}
