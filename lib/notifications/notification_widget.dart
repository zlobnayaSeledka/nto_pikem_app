import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/custom_box_with_shadow.dart';
import 'package:pikem_nto/design/widgets/texts/custom_middle_text.dart';

import '../design/widgets/texts/custom_description_text.dart';

class NotificationWidget extends StatelessWidget {
  final String notificationName;
  final String time;
  const NotificationWidget({super.key, required this.notificationName, required this.time});

  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomMidleText(text: notificationName, size: 15),
            CustomDescriptionText(text: time, size: 15),
          ],
        ),
      ),
    );
  }
}