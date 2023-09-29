import 'package:bego/generated/assets.gen.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BusinessOceanLogo extends StatelessWidget {
  const BusinessOceanLogo({this.showDescription = true, super.key});

  final bool showDescription;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: AppAssets.svg.businessOcean.svg(width: 32)),
          space4,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BeText(
                'Business Ocean'.toUpperCase(),
                style: const TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
                color: BegoColors.slate900,
              ),
              if (showDescription)
                const BeText(
                  'Your Business Your Profit',
                  style: TextStyle(letterSpacing: 2),
                  color: BegoColors.slate900,
                ),
            ],
          ),
        ],
      );
}
