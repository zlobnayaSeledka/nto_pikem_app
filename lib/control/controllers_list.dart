import 'package:flutter/material.dart';
import 'package:pikem_nto/control/controller_widget.dart';
import 'package:pikem_nto/control/doors_controller_widget.dart';
import 'package:pikem_nto/design/widgets/texts/custom_middle_text.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';

import '../design/app_theme.dart';
import '../design/widgets/custom_box_with_shadow.dart';

class ControllersList extends StatefulWidget {
  const ControllersList({super.key});

  @override
  State<ControllersList> createState() => _ControllersListState();
}

class _ControllersListState extends State<ControllersList> {
  bool fireFighting = false;
  bool gasProtection = false;
  bool pump = false;
  bool light = false;
  bool door1 = false;
  bool door2 = false;
  bool door3 = false;
  List<bool> doors = [false, false, false]; 
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
                      mode: fireFighting, 
                      name: "Пожаротушение",
                      onChange: (){
                        setState(() {
                          fireFighting = !fireFighting;
                        });
                      }
                    ),
                    const SizedBox(height: 10),
                    ControllerWidget(
                      mode: gasProtection, 
                      name: "Газозащита",
                      onChange: (){
                        setState(() {
                          gasProtection = !gasProtection;
                        });
                      }
                    ),
                    const SizedBox(height: 10),
                    ControllerWidget(
                      mode: light, 
                      name: "Освещение",
                      onChange: (){
                        setState(() {
                          light = !light;
                        });
                      }
                    ),
                    const SizedBox(height: 10),
                    ControllerWidget(
                      mode: pump, 
                      name: "Насос",
                      onChange: (){
                        setState(() {
                          pump = !pump;
                        });
                      }
                    ),
                  ],
                ),
                SizedBox(width: 10),
                DoorsControllerWidget(
                      door1: door1, 
                      door2: door2, 
                      door3: door3, 
                      onChange1: (){
                        setState(() {
                          door1 = !door1;
                        });
                      }, 
                      onChange2: (){
                        setState(() {
                          door2 = !door2;
                        });
                      }, 
                      onChange3: (){
                        setState(() {
                          door3 = !door3;
                        });
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