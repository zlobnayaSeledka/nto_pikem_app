import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/custom_app_bar.dart';

import '../../notifications/notifications_widget.dart';

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
        child: Column(
          children: [
            const NotificationsWidget()
          ],
        )
      ),
    );
  }
}