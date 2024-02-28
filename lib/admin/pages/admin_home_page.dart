import 'package:flutter/material.dart';
import 'package:pikem_nto/control/controllers_list.dart';
import 'package:pikem_nto/design/widgets/custom_app_bar.dart';
import 'package:pikem_nto/sensors_data/sensors_data_list.dart';
import '../../notifications/notifications_list.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              NotificationsList(), 
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SensorsDataList()
              ), 
              Padding(
                padding: EdgeInsets.all(20),
                child: ControllersList()
              ),
            ],
          ),
        )
      ),
    );
  }
}