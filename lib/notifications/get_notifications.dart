import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pikem_nto/main.dart';

class NotificationsRequests{
  static getNotificationsList() async{
    var postUri = Uri.parse('http://$api/base/nots');
    var response = await http.get(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
    );
    var result = [];
    if (response.statusCode == 200){
      result = json.decode(response.body);
    }
    List<Map> notifications = [];
    List<int> sounds = [0, 0, 0];
    for (int i = 0; i < result.length; i++){
      DateTime date = DateTime.fromMillisecondsSinceEpoch(result[i]['timestamp']*1000);
      String time = '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
      String type = '';
      int flat = result[i]['FlatNum'];
      switch (result[i]['type']){
        case 'fire':
          type = 'В подъезде $flat пожар!!!';
          break;
        case 'earthquake':
          type = 'Началось землетрясение!!!';
          break;
        case 'water_overflow':
          type = 'В доме прорвало трубу!!!';
          break;
        case 'gas_leak':
          type = 'В подъезде $flat утечка газа!!!';
          break;
        case 'sound':
          type = 'В подъезде $flat очень шумно!';
          sounds[flat-1] += 1;
          break;
      }
      if (type != ''){
        notifications.add({'type':type, 'time': time});
      }
    }
    // print(notifications);
    soundsNotifications = sounds;
    // soundsNotifications = [2,0,0];
    // List<Map> notifications = [{"type": "В подъезде 1 пожар!!!", "time":"12:04"}, {"type": "Началось землетрясение!!!", "time": "12:04"}, {"type": "В подъезде 1 пожар!!!", "time":"12:04"}, {"type": "Началось землетрясение!!!", "time": "12:04"}, {"type": "В подъезде 1 пожар!!!", "time":"12:04"}, {"type": "ssssssssние!!!", "time": "12:04"}];
    return notifications;
  }
}