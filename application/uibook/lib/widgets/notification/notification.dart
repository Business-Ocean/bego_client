import 'package:bego_ui/bego_icon.dart';
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
      maxVisible: 2,
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
                title:
                    'Welcome to Flutter Laborum qui nostrud est ipsum consequat consectetur dolor Lorem pariatur amet.',
                description:
                    ' Excepteur magna laborum excepteur consectetur labore sunt sunt culpa qui. Anim dolore elit proident officia proident consequat ea qui veniam sint est.',
                action: 'ok',
                icon: BeIcons.icon_at,
                onActionPressed: () {},
                height: 80,
              ),
              ElevatedButton(
                onPressed: () {
                  BeNotificationsOverlay.of(context)?.show(
                    BeNotification(
                      title: 'Welcome to Flutter',
                      description:
                          ' Fugiat sunt excepteur dolor ad est elit tempor. ',
                      action: 'ok',
                      icon: BeIcons.icon_at,
                      onActionPressed: () {},
                    ),
                  );
                },
                child: const Text('Show notification'),
              ),
            ],
          ),
        ),
      );
}
