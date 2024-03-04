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
  final Function on1;
  final Function on2;
  final Function on3;
  final Function off1;
  final Function off2;
  final Function off3;
  const DoorsControllerWidget({super.key, 
    required this.door1, 
    required this.door2, 
    required this.door3, 
    required this.on1,
    required this.on2,
    required this.on3,
    required this.off1,
    required this.off2,
    required this.off3
  });

  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: (MediaQuery.of(context).size.width-90)/2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTitleText(
                  text: 'Двери', 
                  size: 17,
                ),
                
              ),
              Image.asset(
            'assets/images/door.gif',
            width: 50,
            height: 50,
          ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ControllerWidget(onOn: on1, onOff: off1, name: "Подъезд №1"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: ControllerWidget(onOn: on2, onOff: off2, name: "Подъезд №2"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ControllerWidget(onOn: on3, onOff: off3, name: "Подъезд №3"),
          ),
        ],
      )
    );
  }
}