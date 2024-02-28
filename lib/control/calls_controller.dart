import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/buttons/filled_button.dart';

import '../design/app_theme.dart';
import '../design/widgets/custom_box_with_shadow.dart';
import '../design/widgets/texts/custom_middle_text.dart';

class CallsControllerWidget extends StatelessWidget {
  final Function onChange;
  final String name;
  const CallsControllerWidget({super.key, required this.onChange, required this.name});

  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: (MediaQuery.of(context).size.width-90)/2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomMidleText(
              text: name, 
              size: 15
            ),
            CustomFilledButton(
                textSize: 15,
                text: 'вызов', 
                onTap: (){
                  onChange();
                }
              ),
          ],
        ),
      )
    );
  }
}