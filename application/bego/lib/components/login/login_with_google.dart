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
        style: TextButton.styleFrom(padding: p0),
        child: BeInputLabel(
          label: BeTinyLoader(show: loading),
          position: BeInputLabelPosition.centerRight,
          offset: const Offset(-40, 0),
          child: Container(
            decoration: BoxDecoration(
              color: becolors(context).lightInverse,
              borderRadius: bestyles(context).borderRadius,
              border: Border.all(color: BegoColors.gray300),
            ),
            padding: const EdgeInsets.all(16),
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
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
