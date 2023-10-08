import 'package:bego/generated/assets.gen.dart';
import 'package:bego_component/bego_component.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class LoginInWithGoogle extends StatelessWidget {
  const LoginInWithGoogle({this.onPressed, this.loading = false, super.key});
  final bool loading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: p0,
        ),
        child: BeLabel(
          label: BeTinyLoader(show: loading),
          position: BeLabelPosition.centerRight,
          offset: const Offset(-24, 0),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: becolors(context).lightInverse,
              borderRadius: bestyles(context).borderRadius,
              border: Border.all(color: BegoColors.gray300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppAssets.svg.googleLogo.svg(width: 32),
                space8,
                Text(
                  'Login with Google',
                  style: TextStyle(
                    color: becolors(context).darkInverse,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
