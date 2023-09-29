import 'package:bego/components/company_logo.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Bego by ',
          style: TextStyle(
            fontSize: 12,
            color: becolors(context).text,
          ),
          children: [
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: BusinessOceanLogo(
                showDescription: false,
              ),
            ),
            TextSpan(
              text: '\nTerms of Service & Privacy Policy',
              style: const TextStyle(
                color: BegoColors.blue800,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  const termsCondition =
                      'https://github.com/BusinessOcean/bego-privacy-policy/blob/main/privacy-policy.md';
                  if (await canLaunchUrlString(termsCondition)) {
                    await launchUrlString(termsCondition);
                  }
                },
            ),
          ],
        ),
      );
}
