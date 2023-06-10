import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Backdrop Blur', type: Dialog)
Widget displayBackdropUseCase(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(sampleListData.first.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
    child: Scaffold(
      backgroundColor: BegoColors.splashFactory,
      body: Center(
        child: ElevatedButton(
          onPressed: () => showBlurDialog(context),
          child: const Text('Show Dialog'),
        ),
      ),
    ),
  );
}

void showBlurDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return BeTheme(
          child: BackdropFilter(
              filter: BegoStyle.blurLevel2,
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                backgroundColor: BegoColors.black300,
                child: Container(
                  margin: const EdgeInsets.all(50),
                  width: widthPercent(context, 50),
                  height: widthPercent(context, 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const BeText.headlineMedium(
                        'Blur Title',
                        align: TextAlign.start,
                        color: BegoColors.white,
                      ),
                      const Divider(),
                      const BeText.bodyMedium(
                        'A dialog is a type of modal window that appears in'
                        ' front of app content to provide critical information,'
                        ' or prompt for a decision to be made.',
                        color: BegoColors.white,
                      ),
                      const Spacer(),
                      Center(
                        child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const BeText.titleMedium(
                              'Close',
                              color: BegoColors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 56, vertical: 8),
                            )),
                      )
                    ],
                  ),
                ),
              )),
        );
      });
}
