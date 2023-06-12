import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';
import 'package:uibook/settings/option_helper.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Notification', type: Dialog)
Widget displayNotificationUseCase(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Title');
  final body =
      context.knobs.string(label: 'Notification body', initialValue: '');
  final link = context.knobs.string(label: 'Link text', initialValue: '');
  final dismissible = context.knobs.boolean(label: 'Is Dismissible');
  final position = context.knobs.list(
    label: 'Position',
    options: BeNotificationPosition.values.toOptions(),
  );
  return Scaffold(
    backgroundColor: BegoColors.splashFactory,
    body: BeNotificationsOverlay(
      maxVisible: 1,
      position: position.option ?? BeNotificationPosition.topRight,
      child: _NotificationStoryContent(
        title: title,
        body: body,
        link: link,
        dismissible: dismissible,
      ),
    ),
  );
}

class _NotificationStoryContent extends StatelessWidget {
  const _NotificationStoryContent({
    Key? key,
    required this.title,
    required this.body,
    required this.link,
    required this.dismissible,
  }) : super(key: key);

  final String title;
  final String body;
  final String link;
  final bool dismissible;

  // BeNotificationLink? get _link => link.isNotEmpty
  //     ? BeNotificationLink(
  //         text: Text(link),
  //         onPressed: () {},
  //       )
  //     : null;

  @override
  Widget build(BuildContext context) => Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BeNotification(
                title: title,
                description: body,
                // variant: variant,
                // link: _link,
                onActionPressed: () {},
              ),
              // ...BeNotificationVariant.success.map(
              // (variant) => const
              // ),
              ElevatedButton(
                onPressed: () {
                  BeNotificationsOverlay.of(context)?.show(BeNotification(
                    title: 'title',
                    description: 'body',
                    // variant: variant,
                    // link: _link,
                    onActionPressed: () {},
                  ));
                },
                child: const Text('Show notification'),
              )
            ],
          ),
        ),
      );
}

// void showBlurDialog(BuildContext context) {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return BeTheme(
//           child: BackdropFilter(
//               filter: BegoStyle.blurLevel2,
//               child: Dialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0)),
//                 backgroundColor: BegoColors.black300,
//                 child: Container(
//                   margin: const EdgeInsets.all(50),
//                   width: widthPercent(context, 50),
//                   height: widthPercent(context, 50),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       const BeText.headlineMedium(
//                         'Blur Title',
//                         align: TextAlign.start,
//                         color: BegoColors.white,
//                       ),
//                       const Divider(),
//                       const BeText.bodyMedium(
//                         'A dialog is a type of modal window that appears in'
//                         ' front of app content to provide critical information,'
//                         ' or prompt for a decision to be made.',
//                         color: BegoColors.white,
//                       ),
//                       const Spacer(),
//                       Center(
//                         child: ElevatedButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: const BeText.titleMedium(
//                               'Close',
//                               color: BegoColors.white,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 56, vertical: 8),
//                             )),
//                       )
//                     ],
//                   ),
//                 ),
//               )),
//         );
//       });
// }
