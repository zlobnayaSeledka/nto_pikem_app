import 'package:flutter/material.dart';
import 'package:pikem_nto/control/controller_widget.dart';
import 'package:pikem_nto/control/controllers_requests.dart';
import 'package:pikem_nto/control/doors_controller_widget.dart';
import 'package:pikem_nto/design/widgets/texts/custom_middle_text.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';

import '../design/app_theme.dart';
import '../design/widgets/custom_box_with_shadow.dart';
import '../main.dart';

class ControllersList extends StatefulWidget {
  const ControllersList({super.key});

  @override
  State<ControllersList> createState() => _ControllersListState();
}

class _ControllersListState extends State<ControllersList> {
  
  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: CustomTitleText(text: 'Панель управления', size: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ControllerWidget(
                      name: "Пожаротушение",
                      img: 'assets/images/fire.gif',
                      onOn: (){
                        ControllersRequests.sendCommand('fire', 1, true);
                      },
                      onOff: (){
                        ControllersRequests.sendCommand('fire', 1, false);
                      }
                    ),
                    const SizedBox(height: 10),
                    ControllerWidget(
                      name: "Газозащита",
                      img: 'assets/images/gas.gif',
                      onOn: (){
                        ControllersRequests.sendCommand('gas_leak',1, true);
                      },
                      onOff: (){
                        ControllersRequests.sendCommand('gas_leak',1, false);
                      }
                    ),
                    const SizedBox(height: 10),
                    ControllerWidget(
                      name: "Освещение",
                      img: 'assets/images/light.gif',
                      onOn: (){
                        ControllersRequests.sendCommand('street',1, true);
                      },
                      onOff: (){
                        ControllersRequests.sendCommand('street',1, false);
                      }
                    ),
                    const SizedBox(height: 10),
                    ControllerWidget(
                      name: "Насос",
                      img: 'assets/images/pump.gif',
                      onOn: (){
                        ControllersRequests.sendCommand('pump',1, true);
                      },
                      onOff: (){
                        ControllersRequests.sendCommand('pump',1, false);
                      }
                    ),
                  ],
                ),
                SizedBox(width: 10),
                DoorsControllerWidget(
                      door1: door1, 
                      door2: door2, 
                      door3: door3, 
                      on1: (){
                        ControllersRequests.sendCommand('door',1, true);
                      },
                      off1: (){
                        ControllersRequests.sendCommand('door',1, false);
                      },
                      
                      on2: (){
                        ControllersRequests.sendCommand('door',2, true);
                      },
                      off2: (){
                        ControllersRequests.sendCommand('door',2, false);
                      },

                      on3: (){
                        ControllersRequests.sendCommand('door',3, true);
                      },
                      off3: (){
                        ControllersRequests.sendCommand('door',3, false);
                      }
                    )
              ],
            ),
          ],
        ),
      ),
    );
  }
}