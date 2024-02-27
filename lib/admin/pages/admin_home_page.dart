import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/custom_app_bar.dart';
import 'package:pikem_nto/design/widgets/custom_box_with_shadow.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';

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
            children: [
              const NotificationsList(), 
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomBoxWithShadow(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: const [
                      CustomTitleText(text: 'Данные датчиков', size: 30), 
              
                    ],
                  )
                ),
              )
              
            ],
          ),
        )
      ),
    );
  }
}