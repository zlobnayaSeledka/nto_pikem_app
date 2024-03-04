import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pikem_nto/control/controllers_requests.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_description_text.dart';
import 'package:pikem_nto/sensors_data/get_sensors_data.dart';
import 'package:pikem_nto/sensors_data/sensors_data_widget.dart';

import '../design/widgets/custom_box_with_shadow.dart';
import '../design/widgets/texts/custom_title_text.dart';
import 'flat_data_widget.dart';
Timer? timer;
class SensorsDataList extends StatefulWidget {
  const SensorsDataList({super.key});

  @override
  State<SensorsDataList> createState() => _SensorsDataListState();
}

class _SensorsDataListState extends State<SensorsDataList> {
  bool s1 = false;
  bool s2 = false;
  bool s3 = false;
  bool tap1 = false;
  bool tap2 = false;
  bool tap3 = false;
  bool t1 = true;
  bool t2 = true;
  bool t3 = true;
  void init_timer(){
    timer = Timer.periodic(const Duration(seconds:1),(c){
      setState(() {
         
      });
    });
  }
  @override
  void initState() {
    super.initState();
    init_timer();
  }
  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
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
            
            s2 = data['soundNotifications'][1];
            s3 = data['soundNotifications'][2];
            if (data['soundNotifications'][0] != false || t1){
              s1 = data['soundNotifications'][0];
              t1 = false;
            }
            if (data['soundNotifications'][1] != false || t2){
              s2 = data['soundNotifications'][1];
              t2 = false;
            }
            if (data['soundNotifications'][2] != false || t3){
              s3 = data['soundNotifications'][2];
              t3 = false;
            }
            // if (tap1){
            //   if (s1 != data['soundNotifications'][0]){
                
            //     tap1 = false;
            //   }
            // }
            // if (tap2){
            //   if (s2 != data['soundNotifications'][1]){
                
            //     tap2 = false;
            //   }
            // } 
            // if (tap3){
            //   if (s3 != data['soundNotifications'][2]){
                
            //     tap3 = false;
            //   }
            // }
            print("$s1, $s2, $s3");
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
                      SensorsDataWidget(name: 'Датчик потока', data: waterFlow.toString(), safe: true),//waterFlow < 2.0),
                      const SizedBox(width: 10),
                      SensorsDataWidget(name: 'Датчик протечки', data: waterOverflow.toString(), safe: waterOverflow > 500.0),
                      const SizedBox(width: 10),
                      SensorsDataWidget(name: 'Датчик тока', data: amperage.toString(), safe: true),//amperage < 2.0),
                      const SizedBox(width: 10),
                      SensorsDataWidget(name: 'Датчик тряски', data: axel.toString(), safe: axel < 0.3 && axel > -0.3),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatDataWidget(
                        name: "Подъезд №1", 
                        soundData: sound[0].toString(),  soundNotification: s1, soundSafety: sound[0] < 200.0,
                        gasData: gas[0].toString(), gasSafety: gas[0] < 550.0, 
                        fireData:fire[0].toString(), fireSafety: fire[0] < 4.0,
                        onSoundAlert: (){
                          setState(() {
                            tap1 = true;
                            t1 = true;
                            print("a$s1, $s2, $s3");
                            ControllersRequests.sendCommand('sound', 1, true);
                          });
                        },
                        soundTap: tap1,
                        onSoundTap: (){
                          setState(() {
                            tap1 = false;
                            ControllersRequests.sendCommand('sound', 1, true);
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      FlatDataWidget(
                        name: "Подъезд №2", 
                        soundData: sound[1].toString(),  soundNotification: s2, soundSafety: sound[1] < 200.0,
                        gasData: gas[1].toString(), gasSafety: gas[1] < 550.0, 
                        fireData:fire[1].toString(), fireSafety: fire[1] < 4.0,
                        onSoundAlert: (){
                          setState(() {
                            tap2 = true;
                            t2 = true;
                            print("a$s1, $s2, $s3");
                            ControllersRequests.sendCommand('sound', 2, true);
                          });
                        },
                        soundTap: tap2,
                        onSoundTap: (){
                          setState(() {
                            tap2 = false;
                            ControllersRequests.sendCommand('sound', 2, false);
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                     FlatDataWidget(
                        name: "Подъезд №3", 
                        soundData: sound[2].toString(),  soundNotification: s3, soundSafety: sound[2] < 200.0,
                        gasData: gas[2].toString(), gasSafety: gas[2] < 550.0, 
                        fireData:fire[2].toString(), fireSafety: fire[2] < 4.0,
                        onSoundAlert: (){
                          setState(() {
                            tap3 = true;
                            t3 = true;
                            print("a$s1, $s2, $s3");
                            ControllersRequests.sendCommand('sound', 3, true);
                          });
                        },
                        soundTap: tap3,
                        onSoundTap: (){
                          setState(() {
                            tap3 = false;
                            ControllersRequests.sendCommand('sound', 3, false);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10)
              ],
            );
          }
          return const CustomDescriptionTitleText(text: 'Нет данных');
        }
      )
    );
  }
}