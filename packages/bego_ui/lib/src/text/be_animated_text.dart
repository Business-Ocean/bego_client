import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BeAnimatedText extends StatefulWidget {
  const BeAnimatedText(
    this.texts, {
    super.key,
    this.onComplete,
  });

  final List<String> texts;
  final void Function(int index)? onComplete;

  @override
  State<BeAnimatedText> createState() => _BeAnimatedTextState();
}

class _BeAnimatedTextState extends State<BeAnimatedText> {
  final List<BeText> _eachText = [];
  final _currentTextColor = Colors.black;

  Future<void> _typeText(String wholeText, Color color) async {
    for (var i = 0; i < wholeText.length; i++) {
      await Future<void>.delayed(typeDuration);
      setState(
        () => _eachText.add(
          BeText(
            wholeText[i],
            color: color,
          ),
        ),
      );
      await HapticFeedback.selectionClick();
    }
  }

  Future<void> _unTypeText(String wholeText) async {
    for (var i = wholeText.length - 1; i >= 0; i--) {
      await Future<void>.delayed(unTypeDuration);
      setState(() => _eachText.removeAt(i));
      await HapticFeedback.selectionClick();
    }
  }

  Future<void> _animateText(String text, int index) async {
    await Future<void>.delayed(secondLevelDuration);
    await _typeText(text, _currentTextColor);
    await Future<void>.delayed(secondLevelDuration);
    widget.onComplete?.call(index);
    // setState(() => _currentTextColor = ColorUtils.getRandomColor());
    await _unTypeText(text);
  }

  Future<void> _startAnimation(List<String> texts) async {
    for (var i = 0; i < texts.length; i++) {
      await _animateText(texts[i], i);
    }
  }

  Future<void> _loopAnimation() async {
    while (true) {
      await _startAnimation(widget.texts);
    }
  }

  @override
  void initState() {
    super.initState();
    _loopAnimation();
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 16,
            width: 2,
            decoration: BoxDecoration(
              color: _currentTextColor,
              shape: BoxShape.rectangle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: AnimatedSize(
              clipBehavior: Clip.none,
              duration: typeDuration,
              curve: Curves.easeInOut,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _eachText,
              ),
            ),
          ),
        ],
      );
}

const typeDuration = Duration(milliseconds: 200);
const unTypeDuration = Duration(milliseconds: 100);
const secondLevelDuration = Duration(milliseconds: 300);
