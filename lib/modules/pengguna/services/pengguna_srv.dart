import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/modules/pengguna/all_pengguna.dart';

class PenggunaService {
  //--Variables:

// ========================================================================
//--Get Pengguna Data:
  static Future<List<DataPengguna>> getPengguna() async {
    try {
      var url = Uri.parse(BASE_URL + 'users');
      var response = await http.get(url);
      print('Status Code: ' + response.statusCode.toString());
      if (response.statusCode == 200) {
        var _dataJson = jsonDecode(response.body);
        // var _dataJson = response.body;
        var _dataPengguna = _dataJson['data'];

        print(_dataPengguna);
        return List<DataPengguna>.from(
            _dataPengguna.map((x) => DataPengguna.fromJson(x)));
        //--OR:
        // return _dataPengguna
        //     .map((e) => DataPengguna(
        //           id: e['id'],
        //           firstName: e['first_name'],
        //           lastName: e['last_name'],
        //           email: e['email'],
        //           avatar: e['avatar'],
        //         ))
        //     .toList();
      } else {
        print('Error Connection');
        return [];
      }
    } catch (e) {
      throw Exception('Error getPengguna. ' + e.toString());
    }
  }

  static Future<PenggunaModel> getPenggunaXX() async {
    try {
      var url = Uri.parse(BASE_URL + 'users');
      var response = await http.get(url);
      print('Status Code: ' + response.statusCode.toString());
      List _data = jsonDecode(response.body);
      print(_data);
      if (response.statusCode == 200) {
        PenggunaModel _dataUserModel = await compute(_parseJson, response.body);
        return _dataUserModel;
      } else {
        print('No connect');
        return getPenggunaXX();
      }
    } catch (e) {
      throw Exception('Error getPengguna. ' + e.toString());
    }
  }
}

PenggunaModel _parseJson(String json) =>
    PenggunaModel.fromJson(jsonDecode(json));
