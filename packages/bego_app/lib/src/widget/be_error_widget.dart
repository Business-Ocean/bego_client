import 'package:bego_app/bego_app.dart';
import 'package:bego_app/resource/assets.gen.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BeErrorWidget extends StatelessWidget {
  const BeErrorWidget({
    super.key,
    this.title = defaultErrorTitle,
    this.description = defaultErrorMessage,
    this.retryCallback,
  });

  final String title;
  final String description;
  final VoidCallback? retryCallback;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BeResource.images.workingIllustration.image(
                fit: BoxFit.fitWidth,
                colorBlendMode: BlendMode.color,
                color: becolors(context).scaffoldBackground.withAlpha(100),
              ),
            ),
            space16,
            BeText.labelLarge(
              title,
              color: BegoColors.blueGray800,
            ),
            space4,
            Flexible(
              child: BeText.bodySmall(
                description,
                maxLine: 2,
                color: BegoColors.blueGray,
                align: TextAlign.center,
              ),
            ),
            if (retryCallback != null)
              ElevatedButton(
                onPressed: retryCallback,
                child: const BeText('Try again'),
              ),
          ],
        ),
      );
}
