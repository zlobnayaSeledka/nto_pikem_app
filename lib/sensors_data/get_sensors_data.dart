import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pikem_nto/main.dart';

String api = '192.168.43.254:3333';

class SensorsRequests{
  static getData()async{
    var postUri = Uri.parse('http://$api/base/sensors'); 
    var response = await http.get(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
    );
    var result;
    if (response.statusCode == 200){
      result = json.decode(response.body);
    }
    // result['sound'][0] = 120;
    result['soundNotifications'] = [false,false,false];
    for (int i = 0; i < 3; i ++){
      if (soundsNotificationsWas[i] != soundsNotifications[i]){
        result['soundNotifications'][i] = true;
      }
    }
    soundsNotificationsWas = soundsNotifications;
    return result;
  }
}