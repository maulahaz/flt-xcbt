import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xcbt/configs/all_configs.dart';

class AuthService {
  //--Variables:

//--BOF-----------------------------------------------------------------------------
static Future<Map<String, dynamic>> signin(dynamic data) async {
    var url = Uri.parse(BASE_URL + 'signin');

    var response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: data,
    );
    // print("statusCode: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print('Error: doLogin');
      return {};
    }
  }

//--BOF-----------------------------------------------------------------------------
static Future<Map<String, dynamic>> signup(dynamic data) async {
    var url = Uri.parse(BASE_URL + 'signup');

    var response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: data,
    );
    // print("statusCode: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print('Datanya doLogin: $data');
      return data;
    } else {
      print('Error: doLogin');
      return {};
    }
  }
}