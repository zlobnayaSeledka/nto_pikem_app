import 'package:flutter/material.dart';
import 'package:pikem_nto/admin/pages/admin_home_page.dart';
import 'package:pikem_nto/authorization_page.dart';

List<int> soundsNotifications = [0,0,0];
List<int> soundsNotificationsWas = [0,0,0];
String api = '192.168.43.254:3333';

bool fireFighting = false;
  bool gasProtection = false;
bool pump = false;
bool light = false;
bool door1 = false;
bool door2 = false;
bool door3 = false;
List<bool> doors = [false, false, false]; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthorizationPage()//const AdminHomePage(),
    );
  }
}

