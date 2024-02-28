import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pikem_nto/main.dart';

class ControllersRequests{
  static sendCommand(String type, int flatNum, bool state)async{
    var postUri = Uri.parse('http://$api/base/ctl');
    var response = await http.post(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
      body: jsonEncode({
        "type": type,
        "flat_num": flatNum,
        "state": state
      })
    );
    if (response.statusCode == 200){
      print('happy');
    }
    else{
      print('error');
      print(response.statusCode);
    }
  }
}