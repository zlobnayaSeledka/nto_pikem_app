import 'package:flutter/material.dart';
import 'package:pikem_nto/design/app_theme.dart';

import '../design/widgets/custom_box_with_shadow.dart';
import '../design/widgets/texts/custom_description_text.dart';
import '../design/widgets/texts/custom_title_description_text.dart';
import '../design/widgets/texts/custom_title_text.dart';

class SensorsDataWidget extends StatelessWidget {
  final String name;
  final String data;
  final bool safe;
  const SensorsDataWidget({super.key, required this.name, required this.data, required this.safe});
  @override
  Widget build(BuildContext context) {
    Color color = safe?const Color.fromARGB(255, 0, 193, 93):CustomAppTheme.errorColor;
    return CustomBoxWithShadow(
      shadowColor: color,
      width: (MediaQuery.of(context).size.width-110)/4,
      child:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleText(
              text: name,
              size: 17,
            ),
            const SizedBox(height: 10),
            CustomDescriptionTitleText(text: 'Значение: $data', size: 15), 
            const SizedBox(height: 10),
            CustomDescriptionText(text: safe?'Норма':'Превышение!', size: 15)
          ],
        ),
      ) 
    );
  }
}