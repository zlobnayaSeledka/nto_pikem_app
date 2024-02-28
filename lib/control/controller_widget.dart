import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/buttons/filled_button.dart';

import '../design/app_theme.dart';
import '../design/widgets/custom_box_with_shadow.dart';
import '../design/widgets/texts/custom_middle_text.dart';

class ControllerWidget extends StatelessWidget {
  final Function onOn;
  final Function onOff;
  final String name;
  const ControllerWidget({super.key, required this.onOn, required this.onOff, required this.name});

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
            Row(
              children: [
                CustomFilledButton(
                  textSize: 15,
                  text: 'вкл', 
                  onTap: (){
                    onOn();
                  }
                ),
                const SizedBox(width: 10),
                CustomFilledButton(
                  textSize: 15,
                  text: 'выкл', 
                  onTap: (){
                    onOff();
                  }
                ),
              ],
            ),
            // Switch(
            //   value: mode, 
            //   focusColor: CustomAppTheme.secondColor,
            //   activeColor: CustomAppTheme.secondColor,
            //   inactiveTrackColor: CustomAppTheme.descriptionTextColor.withOpacity(0.5),
            //   onChanged: (val){
            //     // setState(() {
            //     //   fireFighting = !fireFighting;
            //     // });
            //     onChange();
            //   }
            // )
          ],
        ),
      )
    );
  }
}