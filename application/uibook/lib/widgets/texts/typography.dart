import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// @widgetbook.UseCase(
//   name: 'Buttons',
//   type: BeText,
//   designLink:
//       'https://www.figma.com/file/FGjzyMrtehR5q1tMAgSPxn/Material-Me-v2?type=design&node-id=10295%3A260064&t=6VwryFXdXr7zhTBd-1',
// )

@widgetbook.UseCase(name: 'Typography', type: BeText)
Widget displayTypographyUseCase(BuildContext context) {
  final variant = context.knobs.boolean(
          label: 'Text has variation',
          description: 'Color has higher priority then variants'
              ' if color is passed variants will get ignored ')
      ? BeTextVariant.primary
      : BeTextVariant.none;
  final hasColor =
      context.knobs.boolean(label: 'Text Color', initialValue: false);

  final text = context.knobs.string(
    label: 'Display Text',
    initialValue: 'Almost before we knew it, we had left the ground.',
  );
  final color = hasColor ? BegoColors.tertiary : null;
  return ListView(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    children: [
      const BeText(
        'Readex Pro',
        color: BegoColors.black,
        style: TextStyle(fontSize: 68, height: 1.2),
      ),
      const BeText.labelMedium('https://fonts.google.com/specimen/Readex+Pro',
          color: BegoColors.blue),
      const SizedBox(height: 8),
      const BeText.labelMedium(
        'Readex Pro is the world-script expansion of'
        'the Lexend fonts. Readex Pro is designed by Thomas Jockin and Nadine'
        'Chahine and currently supports Latin and Arabic.\n'
        'Lexend is a family of variable fonts designed by Bonnie Shaver-Troup,'
        ' Thomas Jockin and Font Bureau. Applying the Shaver-Troup Individually'
        'Optimal Text Formation Factors, studies have found readers'
        ' instantaneously improve their reading fluency.',
      ),
      const SizedBox(height: 8),
      const Label(textType: 'Display', textSize: 'large'),
      BeText.displayLarge(text, color: color, variant: variant),
      const Label(textType: 'Display', textSize: 'medium'),
      BeText.displayMedium(text, color: color, variant: variant),
      const Label(textType: 'Display', textSize: 'small'),
      BeText.displaySmall(text, color: color, variant: variant),
      const Label(textType: 'Headline', textSize: 'large'),
      BeText.headlineLarge(text, color: color, variant: variant),
      const Label(textType: 'Headline', textSize: 'medium'),
      BeText.headlineMedium(text, color: color, variant: variant),
      const Label(textType: 'Headline', textSize: 'small'),
      BeText.headlineSmall(text, color: color, variant: variant),
      const Label(textType: 'Title', textSize: 'large'),
      BeText.titleLarge(text, color: color, variant: variant),
      const Label(textType: 'Title', textSize: 'medium'),
      BeText.titleMedium(text, color: color, variant: variant),
      const Label(textType: 'Title', textSize: 'small'),
      BeText.titleSmall(text, color: color, variant: variant),
      const Label(textType: 'Body', textSize: 'large'),
      BeText.bodyLarge(text, color: color, variant: variant),
      const Label(textType: 'Body', textSize: 'medium'),
      BeText.bodyMedium(text, color: color, variant: variant),
      const Label(textType: 'Body', textSize: 'small'),
      BeText.bodySmall(text, color: color, variant: variant),
      const Label(textType: 'Label', textSize: 'large'),
      BeText.labelLarge(text, color: color, variant: variant),
      const Label(textType: 'Label', textSize: 'medium'),
      BeText.labelMedium(text, color: color, variant: variant),
      const Label(textType: 'Label', textSize: 'small'),
      BeText.labelSmall(text, color: color, variant: variant),
    ],
  );
}

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.textType,
    required this.textSize,
  });
  final String textType;
  final String textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BeText(
            '$textType / $textSize',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 22 / 16,
              color: BegoColors.black,
            ),
          ),
          const Divider(thickness: 0.2),
        ],
      ),
    );
  }
}
