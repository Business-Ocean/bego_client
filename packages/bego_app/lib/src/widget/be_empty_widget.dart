import 'package:bego_app/resource/assets.gen.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BeEmptyWidget extends StatelessWidget {
  const BeEmptyWidget({
    super.key,
    this.title = _genericEmptyTitle,
    this.description = _genericEmptyDescription,
  });

  final String title;
  final String description;

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
          ],
        ),
      );
}

const _genericEmptyTitle = 'Nothing Here';
const _genericEmptyDescription =
    'This section appears to be empty. You can refresh the page or explore other areas of the app.';
