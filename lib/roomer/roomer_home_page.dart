import 'package:flutter/material.dart';
import 'package:pikem_nto/control/calls_list.dart';
import 'package:pikem_nto/control/doors_controller_widget.dart';

import '../control/controller_widget.dart';
import '../control/controllers_requests.dart';
import '../design/widgets/custom_app_bar.dart';
import '../main.dart';
import '../notifications/notifications_list.dart';

class RoomerHomePage extends StatefulWidget {
  const RoomerHomePage({super.key});

  @override
  State<RoomerHomePage> createState() => _RoomerHomePageState();
}

class _RoomerHomePageState extends State<RoomerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NotificationsList(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ControllerWidget(
                  name: "Освещение",
                  onOn: (){
                    ControllersRequests.sendCommand('street',1, true);
                  },
                  onOff: (){
                    ControllersRequests.sendCommand('street',1, false);
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    ),
                    const SizedBox(width: 20),
                    CallsListControllerWidget(
                      name: 'Вызов скорой', 
                      onChange1: (){}, 
                      onChange2: (){}, 
                      onChange3: (){}
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CallsListControllerWidget(
                        name: 'Уборка снега', 
                        onChange1: (){}, 
                        onChange2: (){}, 
                        onChange3: (){}
                      ),
              ),
            ],
          )
        )
      )
    );
  }
}