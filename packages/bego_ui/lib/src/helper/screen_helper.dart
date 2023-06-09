import 'package:flutter/material.dart';

///  width or height percetage based on [percentage] with respect to [size]
double percentOfSize(double size, double percentage) => size * percentage / 100;

double heightPercent(BuildContext context, double percentage) => percentOfSize(
      MediaQuery.of(context).size.height -
          MediaQuery.of(context).viewPadding.top,
      percentage,
    );

double widthPercent(BuildContext context, double percentage) => percentOfSize(
      MediaQuery.of(context).size.width,
      percentage,
    );

extension SizeExtension on num {
  /// extension on num for geting width of the screen
  double sw(BuildContext context) => widthPercent(context, toDouble());

  /// extension on num for geting height of the screen
  double sh(BuildContext context) => heightPercent(context, toDouble());
}
