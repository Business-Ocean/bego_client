import 'package:flutter/material.dart';

class BeLoadingWidget extends StatelessWidget {
  const BeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(),
        ),
      );
}
