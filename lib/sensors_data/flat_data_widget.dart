import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/buttons/filled_button.dart';
import '../design/widgets/custom_box_with_shadow.dart';
import '../design/widgets/texts/custom_description_text.dart';
import '../design/widgets/texts/custom_middle_text.dart';
import '../design/widgets/texts/custom_title_description_text.dart';
import '../design/widgets/texts/custom_title_text.dart';

class FlatDataWidget extends StatelessWidget {
  final String name;
  final String soundData;
  final String gasData;
  final String fireData;
  final bool soundSafety;
  final bool gasSafety;
  final bool soundNotification;
  final bool fireSafety;
  final Function onSoundAlert;
  final bool soundTap;
  final Function onSoundTap;
  const FlatDataWidget({
    super.key,
    required this.soundNotification, 
    required this.name, 
    required this.soundData, 
    required this.gasSafety, 
    required this.soundSafety, 
    required this.gasData, 
    required this.fireSafety,
    required this.fireData,
    required this.onSoundAlert,
    required this.onSoundTap,
    required this.soundTap
  });
  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: (MediaQuery.of(context).size.width-100)/3,
      child:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleText(
              text: name,
              size: 20,
            ),
            const SizedBox(height: 20),
            CustomBoxWithShadow(
              shadowColor: soundSafety?const Color.fromARGB(255, 0, 193, 93):const Color.fromARGB(255, 248, 99, 0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CustomMidleText(text: 'Датчик шума: ', size: 15),
                          CustomDescriptionTitleText(text: soundData, size: 15)
                        ],
                      ), 
                      const SizedBox(height: 5),
                      CustomDescriptionText(text: soundSafety?'Норма':'Превышение!', size: 15),
                      Visibility(
                        visible: !soundSafety&&soundNotification,
                        child: Padding(
                          padding: const EdgeInsets.only(top:10.0),
                          child: CustomFilledButton(
                            text: 'Выдать предупрежение', 
                            textSize: 15,
                            onTap: (){
                              onSoundAlert();
                            }, 
                            color: const Color.fromARGB(255, 248, 99, 0),
                          ),
                        ) 
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: soundTap,
                        child: Padding(
                          padding: const EdgeInsets.only(top:10.0),
                          child: CustomFilledButton(
                            text: 'Убрать предупрежение', 
                            textSize: 15,
                            onTap: (){
                              onSoundTap();
                            }, 
                            color: const Color.fromARGB(255, 248, 99, 0),
                          ),
                        ) 
                      )
                    ],
                  ),
              ) 
            ),
            const SizedBox(height: 10),
            CustomBoxWithShadow(
              shadowColor: gasSafety?const Color.fromARGB(255, 0, 193, 93):const Color.fromARGB(255, 248, 99, 0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CustomMidleText(text: 'Датчик газа: ', size: 15),
                          CustomDescriptionTitleText(text: gasData, size: 15)
                        ],
                      ), 
                      const SizedBox(height: 5),
                      CustomDescriptionText(text: gasSafety?'Норма':'Превышение!', size: 15),
                    ],
                  ),
              ) 
            ),
            const SizedBox(height: 10),
            CustomBoxWithShadow(
              shadowColor: fireSafety?const Color.fromARGB(255, 0, 193, 93):const Color.fromARGB(255, 248, 99, 0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CustomMidleText(text: 'Датчик пожара: ', size: 15),
                          CustomDescriptionTitleText(text: fireData, size: 15)
                        ],
                      ), 
                      const SizedBox(height: 5),
                      CustomDescriptionText(text: fireSafety?'Норма':'Превышение!', size: 15),
                    ],
                  ),
              ) 
            ),
          ],
        ),
      ) 
    );
  }
}