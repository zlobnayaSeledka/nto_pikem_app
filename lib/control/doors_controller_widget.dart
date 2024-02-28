import 'package:flutter/material.dart';
import 'package:pikem_nto/control/controller_widget.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';

import '../design/app_theme.dart';
import '../design/widgets/custom_box_with_shadow.dart';
import '../design/widgets/texts/custom_middle_text.dart';

class DoorsControllerWidget extends StatelessWidget {
  final bool door1;
  final bool door2;
  final bool door3;
  final Function onChange1;
  final Function onChange2;
  final Function onChange3;
  const DoorsControllerWidget({super.key, 
    required this.door1, 
    required this.door2, 
    required this.door3, 
    required this.onChange1,
    required this.onChange2,
    required this.onChange3
  });

  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: (MediaQuery.of(context).size.width-90)/2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTitleText(
              text: 'Двери', 
              size: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ControllerWidget(mode: door1, onChange: onChange1, name: "Подъезд №1"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: ControllerWidget(mode: door2, onChange: onChange2, name: "Подъезд №2"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ControllerWidget(mode: door3, onChange: onChange3, name: "Подъезд №3"),
          ),
        ],
      )
    );
  }
}