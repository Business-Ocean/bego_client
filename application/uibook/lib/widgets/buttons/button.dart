import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Buttons',
  type: ElevatedButton,
  designLink:
      'https://www.figma.com/file/taoQSMi6WeUgzEoZvZmHmI/Widgetbook-Demo-App?node-id=334%3A7021&t=TUtcSZxxeTbrf3zM-4',
)
Widget authButtonsDefaultUseCase(BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(context.knobs.string(label: 'Text', initialValue: 'Button')),
  );
}
