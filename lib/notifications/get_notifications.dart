import 'dart:convert';

import 'package:http/http.dart' as http;

String api = '192.168.43.254:3333';

class NotificationsRequests{
  static getNotificationsList() async{
    var postUri = Uri.parse('http://$api/base/nots');
    var response = await http.get(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
    );
    var res;
    if (response.statusCode == 200){
      res = jsonDecode(response.body);
      print('happy happy happy');
      print(res);
    }
    else{
      print('skeleton');
    }
    return [{'a', '10:32'}, {'b', '11:32'}, {'c', '14:32'}, {'d', '15:32'}];
  }
}