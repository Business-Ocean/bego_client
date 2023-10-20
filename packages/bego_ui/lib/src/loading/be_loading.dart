import 'package:flutter/material.dart';

class BeLoading extends StatelessWidget {
  const BeLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(),
        ),
      );
}
