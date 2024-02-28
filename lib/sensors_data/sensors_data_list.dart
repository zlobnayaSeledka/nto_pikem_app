import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_description_text.dart';
import 'package:pikem_nto/sensors_data/get_sensors_data.dart';
import 'package:pikem_nto/sensors_data/sensors_data_widget.dart';

import '../design/widgets/custom_box_with_shadow.dart';
import '../design/widgets/texts/custom_title_text.dart';
import 'flat_data_widget.dart';

class SensorsDataList extends StatefulWidget {
  const SensorsDataList({super.key});

  @override
  State<SensorsDataList> createState() => _SensorsDataListState();
}

class _SensorsDataListState extends State<SensorsDataList> {
  bool s1 = false;
  bool s2 = false;
  bool s3 = false;
  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<dynamic>(
        future: SensorsRequests.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            var data = snapshot.data!;
            double waterFlow = data['water_flow'] ?? -1.0;
            double waterOverflow = data['water_overflow'] ?? -1.0;
            double amperage = data['amperage'] ?? -1.0;
            double axel = data['axel'] ?? -1.0;
            List sound = data['sound'] ?? [-1, -1, -1];
            List gas = data['gas'] ?? [-1, -1, -1];
            List fire = data['fire'] ?? [-1, -1, -1];
            if (!s1){
              s1 = data['soundNotifications'][0];
            }
            if (!s2){
              s2 = data['soundNotifications'][1];
            }
            if (!s3){
              s3 = data['soundNotifications'][2];
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [ 
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTitleText(text: 'Данные датчиков', size: 25),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 20),
                  child: Row(
                    children: [
                      SensorsDataWidget(name: 'Датчик потока', data: waterFlow.toString(), safe: waterFlow < 2.0),
                      const SizedBox(width: 10),
                      SensorsDataWidget(name: 'Датчик протечки', data: waterOverflow.toString(), safe: waterOverflow < 2.0),
                      const SizedBox(width: 10),
                      SensorsDataWidget(name: 'Датчик тока', data: amperage.toString(), safe: amperage < 2.0),
                      const SizedBox(width: 10),
                      SensorsDataWidget(name: 'Датчик тряски', data: axel.toString(), safe: axel < 2.0),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatDataWidget(
                        name: "Подъезд №1", 
                        soundData: sound[0].toString(),  soundNotification: s1, soundSafety: sound[0] < 4.0,
                        gasData: gas[0].toString(), gasSafety: gas[0] < 4.0, 
                        fireData:fire[0].toString(), fireSafety: fire[0] < 4.0,
                        onSoundAlert: (){
                          setState(() {
                            s1 = false;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      FlatDataWidget(
                        name: "Подъезд №2", 
                        soundData: sound[1].toString(),  soundNotification: s2, soundSafety: sound[1] < 4.0,
                        gasData: gas[1].toString(), gasSafety: gas[1] < 4.0, 
                        fireData:fire[1].toString(), fireSafety: fire[1] < 4.0,
                        onSoundAlert: (){
                          setState(() {
                            s2 = false;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                     FlatDataWidget(
                        name: "Подъезд №3", 
                        soundData: sound[2].toString(),  soundNotification: s3, soundSafety: sound[2] < 4.0,
                        gasData: gas[2].toString(), gasSafety: gas[2] < 4.0, 
                        fireData:fire[2].toString(), fireSafety: fire[2] < 4.0,
                        onSoundAlert: (){
                          setState(() {
                            s3 = false;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return const CustomDescriptionTitleText(text: 'Нет данных');
        }
      )
    );
  }
}