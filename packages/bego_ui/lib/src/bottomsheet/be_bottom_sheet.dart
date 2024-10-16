import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/bottomsheet/be_common_bottom_sheet.dart';
import 'package:flutter/material.dart';

// TODO(Soruav): Build this component and other form component
class BeBottomSheet {
  const BeBottomSheet._();

  static Future<T?> showBottomSheet<T>(BuildContext context) async =>
      showModalBottomSheet<T?>(
        context: context,
        // isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => BeCommonActionSheet(
          title:
              'auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content auxiliary content',
          actions: List.generate(
            40,
            (index) => BeCommonActionSheetItem('Item$index'),
          ),
          maxSheetHeight: 560,
          titleWidget: const BeText.headlineSmall('Title'),
          cancelTitle: 'Custom cancellation name',
          maxTitleLines: 10,
          clickCallBack: (
            int index,
            BeCommonActionSheetItem actionEle,
          ) {
            // print(index);
            // final String? title = actionEle.title;
            // BeToast.show(
            //   context,
            //   'title: $title, index: $index',
            // );
          },
        ),
      );
}
