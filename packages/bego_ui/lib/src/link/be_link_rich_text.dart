import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BeLinkRichText extends StatelessWidget {
  const BeLinkRichText({
    super.key,
    required this.text,
    this.onLinkTap,
  });
  final String text;
  final ValueChanged<String>? onLinkTap;

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    final spans = <InlineSpan>[];
    final uriRegex = RegExp(r'https?://[^\s/$.?#].[^\s]*');
    for (final word in words) {
      if (word.contains('http')) {
        spans
          ..add(
            const TextSpan(
              text: ' ',
            ),
          )
          ..add(
            TextSpan(
              text: word.replaceAll(
                uriRegex,
                word,
              ),
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onLinkTap?.call(word);
                },
            ),
          )
          ..add(
            const TextSpan(
              text: ' ',
            ),
          );
      } else {
        spans.add(
          TextSpan(
            text: word,
          ),
        );
      }
    }

    return RichText(
      text: TextSpan(
        style: bestyles(context).bodyMedium,
        children: spans,
      ),
    );
  }
}
