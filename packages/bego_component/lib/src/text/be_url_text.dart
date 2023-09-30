library url_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Url & Text mix Widget
class BeUrlText extends StatelessWidget {
  /// Create a UrlText widget.
  const BeUrlText(
    this.text, {
    super.key,
    this.style = defaultStyle,
    this.urlStyle = defaultUrlStyle,
    this.markdown = false,
  });
  static const TextStyle defaultStyle = TextStyle(color: Colors.black);
  static const TextStyle defaultUrlStyle = TextStyle(color: Colors.blue);

  /// The Url and Text mix String
  final String text;

  /// The Text style
  final TextStyle style;

  /// The Url style
  final TextStyle urlStyle;

  /// Using Markdown link style
  final bool markdown;

  List<InlineSpan> _getUrlTextSpans() {
    final widgets = <InlineSpan>[];
    final reg = RegExp(
      r'(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*',
    );
    final Iterable<Match> matches = reg.allMatches(text);
    final resultMatches = <_ResultMatch>[];
    var start = 0;
    for (final match in matches) {
      if (match.group(0)!.isNotEmpty) {
        if (start != match.start) {
          final result1 = _ResultMatch()
            ..isUrl = false
            ..text = text.substring(start, match.start)
            ..link = '';
          resultMatches.add(result1);
        }

        final result2 = _ResultMatch()
          ..isUrl = true
          ..text = match.group(0)!
          ..link = match.group(0)!;
        resultMatches.add(result2);
        start = match.end;
      }
    }
    if (start < text.length) {
      final result1 = _ResultMatch()
        ..isUrl = false
        ..text = text.substring(start)
        ..link = text.substring(start);
      resultMatches.add(result1);
    }
    for (final result in resultMatches) {
      if (result.isUrl) {
        widgets.add(
          _LinkTextSpan(
            result.text,
            result.text,
            urlStyle,
          ),
        );
      } else {
        widgets.add(
          TextSpan(
            text: result.text,
            style: style,
          ),
        );
      }
    }
    return widgets;
  }

  List<InlineSpan> _getMarkdownUrlTextSpans() {
    final widgets = <InlineSpan>[];
    final reg = RegExp(
      r'\[([^\[]*)\]\(((https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*)\)',
    );
    final Iterable<Match> matches = reg.allMatches(text);
    final resultMatches = <_ResultMatch>[];
    var start = 0;
    for (final match in matches) {
      if (match.group(0)!.isNotEmpty) {
        if (start != match.start) {
          final result1 = _ResultMatch()
            ..isUrl = false
            ..text = text.substring(start, match.start)
            ..link = '';
          resultMatches.add(result1);
        }

        final result2 = _ResultMatch()
          ..isUrl = true
          ..text = match.group(1)!
          ..link = match.group(2)!;
        resultMatches.add(result2);
        start = match.end;
      }
    }
    if (start < text.length) {
      final result1 = _ResultMatch()
        ..isUrl = false
        ..text = text.substring(start)
        ..link = '';
      resultMatches.add(result1);
    }
    for (final result in resultMatches) {
      if (result.isUrl) {
        widgets.add(
          _LinkTextSpan(
            result.text,
            result.link,
            urlStyle,
          ),
        );
      } else {
        widgets.add(
          TextSpan(
            text: result.text,
            style: style,
          ),
        );
      }
    }
    return widgets;
  }

  List<InlineSpan> _getTextSpans() {
    if (markdown) {
      return _getMarkdownUrlTextSpans();
    } else {
      return _getUrlTextSpans();
    }
  }

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(children: _getTextSpans()),
      );
}

class _LinkTextSpan extends TextSpan {
  _LinkTextSpan(String text, String link, TextStyle style)
      : super(
          style: style,
          text: text,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse(link));
            },
        );
}

class _ResultMatch {
  late bool isUrl;
  late String text;
  late String link;
}
